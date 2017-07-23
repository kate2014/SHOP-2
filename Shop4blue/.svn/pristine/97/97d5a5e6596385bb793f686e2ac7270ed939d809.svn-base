package com.shop.entity;

import java.util.ArrayList;
import java.util.List;

public class XxPromotionProductCategoryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public XxPromotionProductCategoryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPromotionsIsNull() {
            addCriterion("promotions is null");
            return (Criteria) this;
        }

        public Criteria andPromotionsIsNotNull() {
            addCriterion("promotions is not null");
            return (Criteria) this;
        }

        public Criteria andPromotionsEqualTo(Long value) {
            addCriterion("promotions =", value, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsNotEqualTo(Long value) {
            addCriterion("promotions <>", value, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsGreaterThan(Long value) {
            addCriterion("promotions >", value, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsGreaterThanOrEqualTo(Long value) {
            addCriterion("promotions >=", value, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsLessThan(Long value) {
            addCriterion("promotions <", value, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsLessThanOrEqualTo(Long value) {
            addCriterion("promotions <=", value, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsIn(List<Long> values) {
            addCriterion("promotions in", values, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsNotIn(List<Long> values) {
            addCriterion("promotions not in", values, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsBetween(Long value1, Long value2) {
            addCriterion("promotions between", value1, value2, "promotions");
            return (Criteria) this;
        }

        public Criteria andPromotionsNotBetween(Long value1, Long value2) {
            addCriterion("promotions not between", value1, value2, "promotions");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesIsNull() {
            addCriterion("product_categories is null");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesIsNotNull() {
            addCriterion("product_categories is not null");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesEqualTo(Long value) {
            addCriterion("product_categories =", value, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesNotEqualTo(Long value) {
            addCriterion("product_categories <>", value, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesGreaterThan(Long value) {
            addCriterion("product_categories >", value, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesGreaterThanOrEqualTo(Long value) {
            addCriterion("product_categories >=", value, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesLessThan(Long value) {
            addCriterion("product_categories <", value, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesLessThanOrEqualTo(Long value) {
            addCriterion("product_categories <=", value, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesIn(List<Long> values) {
            addCriterion("product_categories in", values, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesNotIn(List<Long> values) {
            addCriterion("product_categories not in", values, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesBetween(Long value1, Long value2) {
            addCriterion("product_categories between", value1, value2, "productCategories");
            return (Criteria) this;
        }

        public Criteria andProductCategoriesNotBetween(Long value1, Long value2) {
            addCriterion("product_categories not between", value1, value2, "productCategories");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}