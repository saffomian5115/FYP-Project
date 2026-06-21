from sqlalchemy.orm import Session
from app.ai.analytics_engine import AnalyticsEngine
from app.models.ai_analytics import (
    StudentPerformanceScore, ChatbotFAQ
)


class AnalyticsService:

    @staticmethod
    def calculate_and_save(db: Session, student_id: int, semester_id: int):
        data = AnalyticsEngine.calculate_for_student(
            db, student_id, semester_id
        )
        score = AnalyticsEngine.save_score(db, data)
        return score, None

    @staticmethod
    def get_student_score(db: Session, student_id: int, semester_id: int):
        return db.query(StudentPerformanceScore).filter(
            StudentPerformanceScore.student_id == student_id,
            StudentPerformanceScore.semester_id == semester_id
        ).first()

    @staticmethod
    def get_all_scores(db: Session, semester_id: int):
        return db.query(StudentPerformanceScore).filter(
            StudentPerformanceScore.semester_id == semester_id
        ).order_by(
            StudentPerformanceScore.academic_score.desc()
        ).all()

    @staticmethod
    def calculate_ranks(db: Session, semester_id: int):
        count = AnalyticsEngine.calculate_ranks(db, semester_id)
        return count


class FAQService:

    @staticmethod
    def create(db: Session, data: dict):
        faq = ChatbotFAQ(**data)
        db.add(faq)
        db.commit()
        db.refresh(faq)
        return faq, None

    @staticmethod
    def get_all(db: Session, category: str = None):
        query = db.query(ChatbotFAQ).filter(ChatbotFAQ.is_active == True)
        if category:
            query = query.filter(ChatbotFAQ.category == category)
        return query.order_by(ChatbotFAQ.view_count.desc()).all()

    @staticmethod
    def get_by_id(db: Session, faq_id: int):
        return db.query(ChatbotFAQ).filter(
            ChatbotFAQ.id == faq_id
        ).first()

    @staticmethod
    def update(db: Session, faq_id: int, data: dict):
        faq = db.query(ChatbotFAQ).filter(ChatbotFAQ.id == faq_id).first()
        if not faq:
            return None, "FAQ not found"
        for key, value in data.items():
            setattr(faq, key, value)
        db.commit()
        db.refresh(faq)
        return faq, None

    @staticmethod
    def vote(db: Session, faq_id: int, helpful: bool):
        faq = db.query(ChatbotFAQ).filter(ChatbotFAQ.id == faq_id).first()
        if not faq:
            return None, "FAQ not found"
        if helpful:
            faq.helpful_count += 1
        else:
            faq.not_helpful_count += 1
        db.commit()
        return faq, None

    @staticmethod
    def search(db: Session, query: str):
        """Search FAQs by keyword (case-insensitive match on question/answer)."""
        return db.query(ChatbotFAQ).filter(
            ChatbotFAQ.is_active == True,
            (ChatbotFAQ.question.ilike(f"%{query}%")) | (ChatbotFAQ.answer.ilike(f"%{query}%"))
        ).order_by(ChatbotFAQ.view_count.desc()).all()


