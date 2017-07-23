package com.shop.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class XxMessageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public XxMessageExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateIsNull() {
            addCriterion("modify_date is null");
            return (Criteria) this;
        }

        public Criteria andModifyDateIsNotNull() {
            addCriterion("modify_date is not null");
            return (Criteria) this;
        }

        public Criteria andModifyDateEqualTo(Date value) {
            addCriterion("modify_date =", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotEqualTo(Date value) {
            addCriterion("modify_date <>", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateGreaterThan(Date value) {
            addCriterion("modify_date >", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateGreaterThanOrEqualTo(Date value) {
            addCriterion("modify_date >=", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateLessThan(Date value) {
            addCriterion("modify_date <", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateLessThanOrEqualTo(Date value) {
            addCriterion("modify_date <=", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateIn(List<Date> values) {
            addCriterion("modify_date in", values, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotIn(List<Date> values) {
            addCriterion("modify_date not in", values, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateBetween(Date value1, Date value2) {
            addCriterion("modify_date between", value1, value2, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotBetween(Date value1, Date value2) {
            addCriterion("modify_date not between", value1, value2, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andIpIsNull() {
            addCriterion("ip is null");
            return (Criteria) this;
        }

        public Criteria andIpIsNotNull() {
            addCriterion("ip is not null");
            return (Criteria) this;
        }

        public Criteria andIpEqualTo(String value) {
            addCriterion("ip =", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotEqualTo(String value) {
            addCriterion("ip <>", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpGreaterThan(String value) {
            addCriterion("ip >", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpGreaterThanOrEqualTo(String value) {
            addCriterion("ip >=", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLessThan(String value) {
            addCriterion("ip <", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLessThanOrEqualTo(String value) {
            addCriterion("ip <=", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLike(String value) {
            addCriterion("ip like", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotLike(String value) {
            addCriterion("ip not like", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpIn(List<String> values) {
            addCriterion("ip in", values, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotIn(List<String> values) {
            addCriterion("ip not in", values, "ip");
            return (Criteria) this;
        }

        public Criteria andIpBetween(String value1, String value2) {
            addCriterion("ip between", value1, value2, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotBetween(String value1, String value2) {
            addCriterion("ip not between", value1, value2, "ip");
            return (Criteria) this;
        }

        public Criteria andIsDraftIsNull() {
            addCriterion("is_draft is null");
            return (Criteria) this;
        }

        public Criteria andIsDraftIsNotNull() {
            addCriterion("is_draft is not null");
            return (Criteria) this;
        }

        public Criteria andIsDraftEqualTo(Boolean value) {
            addCriterion("is_draft =", value, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftNotEqualTo(Boolean value) {
            addCriterion("is_draft <>", value, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftGreaterThan(Boolean value) {
            addCriterion("is_draft >", value, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_draft >=", value, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftLessThan(Boolean value) {
            addCriterion("is_draft <", value, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftLessThanOrEqualTo(Boolean value) {
            addCriterion("is_draft <=", value, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftIn(List<Boolean> values) {
            addCriterion("is_draft in", values, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftNotIn(List<Boolean> values) {
            addCriterion("is_draft not in", values, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftBetween(Boolean value1, Boolean value2) {
            addCriterion("is_draft between", value1, value2, "isDraft");
            return (Criteria) this;
        }

        public Criteria andIsDraftNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_draft not between", value1, value2, "isDraft");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteIsNull() {
            addCriterion("receiver_delete is null");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteIsNotNull() {
            addCriterion("receiver_delete is not null");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteEqualTo(Boolean value) {
            addCriterion("receiver_delete =", value, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteNotEqualTo(Boolean value) {
            addCriterion("receiver_delete <>", value, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteGreaterThan(Boolean value) {
            addCriterion("receiver_delete >", value, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteGreaterThanOrEqualTo(Boolean value) {
            addCriterion("receiver_delete >=", value, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteLessThan(Boolean value) {
            addCriterion("receiver_delete <", value, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteLessThanOrEqualTo(Boolean value) {
            addCriterion("receiver_delete <=", value, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteIn(List<Boolean> values) {
            addCriterion("receiver_delete in", values, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteNotIn(List<Boolean> values) {
            addCriterion("receiver_delete not in", values, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteBetween(Boolean value1, Boolean value2) {
            addCriterion("receiver_delete between", value1, value2, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverDeleteNotBetween(Boolean value1, Boolean value2) {
            addCriterion("receiver_delete not between", value1, value2, "receiverDelete");
            return (Criteria) this;
        }

        public Criteria andReceiverReadIsNull() {
            addCriterion("receiver_read is null");
            return (Criteria) this;
        }

        public Criteria andReceiverReadIsNotNull() {
            addCriterion("receiver_read is not null");
            return (Criteria) this;
        }

        public Criteria andReceiverReadEqualTo(Boolean value) {
            addCriterion("receiver_read =", value, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadNotEqualTo(Boolean value) {
            addCriterion("receiver_read <>", value, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadGreaterThan(Boolean value) {
            addCriterion("receiver_read >", value, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadGreaterThanOrEqualTo(Boolean value) {
            addCriterion("receiver_read >=", value, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadLessThan(Boolean value) {
            addCriterion("receiver_read <", value, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadLessThanOrEqualTo(Boolean value) {
            addCriterion("receiver_read <=", value, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadIn(List<Boolean> values) {
            addCriterion("receiver_read in", values, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadNotIn(List<Boolean> values) {
            addCriterion("receiver_read not in", values, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadBetween(Boolean value1, Boolean value2) {
            addCriterion("receiver_read between", value1, value2, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andReceiverReadNotBetween(Boolean value1, Boolean value2) {
            addCriterion("receiver_read not between", value1, value2, "receiverRead");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteIsNull() {
            addCriterion("sender_delete is null");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteIsNotNull() {
            addCriterion("sender_delete is not null");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteEqualTo(Boolean value) {
            addCriterion("sender_delete =", value, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteNotEqualTo(Boolean value) {
            addCriterion("sender_delete <>", value, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteGreaterThan(Boolean value) {
            addCriterion("sender_delete >", value, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteGreaterThanOrEqualTo(Boolean value) {
            addCriterion("sender_delete >=", value, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteLessThan(Boolean value) {
            addCriterion("sender_delete <", value, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteLessThanOrEqualTo(Boolean value) {
            addCriterion("sender_delete <=", value, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteIn(List<Boolean> values) {
            addCriterion("sender_delete in", values, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteNotIn(List<Boolean> values) {
            addCriterion("sender_delete not in", values, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteBetween(Boolean value1, Boolean value2) {
            addCriterion("sender_delete between", value1, value2, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderDeleteNotBetween(Boolean value1, Boolean value2) {
            addCriterion("sender_delete not between", value1, value2, "senderDelete");
            return (Criteria) this;
        }

        public Criteria andSenderReadIsNull() {
            addCriterion("sender_read is null");
            return (Criteria) this;
        }

        public Criteria andSenderReadIsNotNull() {
            addCriterion("sender_read is not null");
            return (Criteria) this;
        }

        public Criteria andSenderReadEqualTo(Boolean value) {
            addCriterion("sender_read =", value, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadNotEqualTo(Boolean value) {
            addCriterion("sender_read <>", value, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadGreaterThan(Boolean value) {
            addCriterion("sender_read >", value, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadGreaterThanOrEqualTo(Boolean value) {
            addCriterion("sender_read >=", value, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadLessThan(Boolean value) {
            addCriterion("sender_read <", value, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadLessThanOrEqualTo(Boolean value) {
            addCriterion("sender_read <=", value, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadIn(List<Boolean> values) {
            addCriterion("sender_read in", values, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadNotIn(List<Boolean> values) {
            addCriterion("sender_read not in", values, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadBetween(Boolean value1, Boolean value2) {
            addCriterion("sender_read between", value1, value2, "senderRead");
            return (Criteria) this;
        }

        public Criteria andSenderReadNotBetween(Boolean value1, Boolean value2) {
            addCriterion("sender_read not between", value1, value2, "senderRead");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andForMessageIsNull() {
            addCriterion("for_message is null");
            return (Criteria) this;
        }

        public Criteria andForMessageIsNotNull() {
            addCriterion("for_message is not null");
            return (Criteria) this;
        }

        public Criteria andForMessageEqualTo(Long value) {
            addCriterion("for_message =", value, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageNotEqualTo(Long value) {
            addCriterion("for_message <>", value, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageGreaterThan(Long value) {
            addCriterion("for_message >", value, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageGreaterThanOrEqualTo(Long value) {
            addCriterion("for_message >=", value, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageLessThan(Long value) {
            addCriterion("for_message <", value, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageLessThanOrEqualTo(Long value) {
            addCriterion("for_message <=", value, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageIn(List<Long> values) {
            addCriterion("for_message in", values, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageNotIn(List<Long> values) {
            addCriterion("for_message not in", values, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageBetween(Long value1, Long value2) {
            addCriterion("for_message between", value1, value2, "forMessage");
            return (Criteria) this;
        }

        public Criteria andForMessageNotBetween(Long value1, Long value2) {
            addCriterion("for_message not between", value1, value2, "forMessage");
            return (Criteria) this;
        }

        public Criteria andReceiverIsNull() {
            addCriterion("receiver is null");
            return (Criteria) this;
        }

        public Criteria andReceiverIsNotNull() {
            addCriterion("receiver is not null");
            return (Criteria) this;
        }

        public Criteria andReceiverEqualTo(Long value) {
            addCriterion("receiver =", value, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverNotEqualTo(Long value) {
            addCriterion("receiver <>", value, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverGreaterThan(Long value) {
            addCriterion("receiver >", value, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverGreaterThanOrEqualTo(Long value) {
            addCriterion("receiver >=", value, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverLessThan(Long value) {
            addCriterion("receiver <", value, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverLessThanOrEqualTo(Long value) {
            addCriterion("receiver <=", value, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverIn(List<Long> values) {
            addCriterion("receiver in", values, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverNotIn(List<Long> values) {
            addCriterion("receiver not in", values, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverBetween(Long value1, Long value2) {
            addCriterion("receiver between", value1, value2, "receiver");
            return (Criteria) this;
        }

        public Criteria andReceiverNotBetween(Long value1, Long value2) {
            addCriterion("receiver not between", value1, value2, "receiver");
            return (Criteria) this;
        }

        public Criteria andSenderIsNull() {
            addCriterion("sender is null");
            return (Criteria) this;
        }

        public Criteria andSenderIsNotNull() {
            addCriterion("sender is not null");
            return (Criteria) this;
        }

        public Criteria andSenderEqualTo(Long value) {
            addCriterion("sender =", value, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderNotEqualTo(Long value) {
            addCriterion("sender <>", value, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderGreaterThan(Long value) {
            addCriterion("sender >", value, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderGreaterThanOrEqualTo(Long value) {
            addCriterion("sender >=", value, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderLessThan(Long value) {
            addCriterion("sender <", value, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderLessThanOrEqualTo(Long value) {
            addCriterion("sender <=", value, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderIn(List<Long> values) {
            addCriterion("sender in", values, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderNotIn(List<Long> values) {
            addCriterion("sender not in", values, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderBetween(Long value1, Long value2) {
            addCriterion("sender between", value1, value2, "sender");
            return (Criteria) this;
        }

        public Criteria andSenderNotBetween(Long value1, Long value2) {
            addCriterion("sender not between", value1, value2, "sender");
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