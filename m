Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298F4ED8C9
	for <lists+linux-cachefs@lfdr.de>; Thu, 31 Mar 2022 13:58:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-NPCYxUUgN5K_KcRiZXlszQ-1; Thu, 31 Mar 2022 07:58:08 -0400
X-MC-Unique: NPCYxUUgN5K_KcRiZXlszQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DCE41C05ADC;
	Thu, 31 Mar 2022 11:58:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0445F401E76;
	Thu, 31 Mar 2022 11:58:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D15271947BBD;
	Thu, 31 Mar 2022 11:58:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A98119451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 11:58:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7665D40C1438; Thu, 31 Mar 2022 11:58:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72C2C400E10D
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 11:58:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCF33838C80
 for <linux-cachefs@redhat.com>; Thu, 31 Mar 2022 11:58:06 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Ye3lpgLbMVyvt6I6fC-dEw-1; Thu, 31 Mar 2022 07:58:04 -0400
X-MC-Unique: Ye3lpgLbMVyvt6I6fC-dEw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8iijnE_1648727878
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8iijnE_1648727878) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 31 Mar 2022 19:57:59 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Thu, 31 Mar 2022 19:57:37 +0800
Message-Id: <20220331115753.89431-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20220331115753.89431-1-jefflexu@linux.alibaba.com>
References: <20220331115753.89431-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v7 03/19] cachefiles: notify user daemon
 when withdrawing cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Notify user daemon that cookie is going to be withdrawn, providing a
hint that the associated anon_fd can be closed. The anon_fd attached in
the CLOSE request shall be same with that in the previous OPEN request.

Be noted that this is only a hint. User daemon can close the anon_fd
when receiving the CLOSE request, then it will receive another anon_fd
if the cookie gets looked up. Or it can also ignore the CLOSE request,
and keep writing data into the anon_fd. However the next time cookie
gets looked up, the user daemon will still receive another anon_fd.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/interface.c       |  2 ++
 fs/cachefiles/internal.h        |  5 +++++
 fs/cachefiles/ondemand.c        | 34 +++++++++++++++++++++++++++++++++
 include/uapi/linux/cachefiles.h |  5 +++++
 4 files changed, 46 insertions(+)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index ae93cee9d25d..a69073a1d3f0 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -362,6 +362,8 @@ static void cachefiles_withdraw_cookie(struct fscache_cookie *cookie)
 		spin_unlock(&cache->object_list_lock);
 	}
 
+	cachefiles_ondemand_clean_object(object);
+
 	if (object->file) {
 		cachefiles_begin_secure(cache, &saved_cred);
 		cachefiles_clean_up_object(object, cache);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 7d5c7d391fdb..8a397d4da560 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -279,6 +279,7 @@ extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
 				     char *args);
 
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
+extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
@@ -291,6 +292,10 @@ static inline int cachefiles_ondemand_init_object(struct cachefiles_object *obje
 {
 	return 0;
 }
+
+static inline void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
+{
+}
 #endif
 
 /*
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index f0e6e422263b..8cbfba057616 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -209,6 +209,12 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 		goto err_put_fd;
 	}
 
+	/* CLOSE request has no reply */
+	if (msg->opcode == CACHEFILES_OP_CLOSE) {
+		xa_erase(&cache->reqs, id);
+		complete(&req->done);
+	}
+
 	return n;
 
 err_put_fd:
@@ -332,6 +338,26 @@ static int init_open_req(struct cachefiles_req *req, void *private)
 	return 0;
 }
 
+static int init_close_req(struct cachefiles_req *req, void *private)
+{
+	struct cachefiles_object *object = req->object;
+	struct cachefiles_close *load = (void *)req->msg.data;
+	int fd = object->fd;
+
+	if (WARN_ON_ONCE(fd == -1))
+		return -EIO;
+
+	/*
+	 * It's possible if the cookie looking up phase failed before READ
+	 * request has ever been sent.
+	 */
+	if (fd == 0)
+		return -ENOENT;
+
+	load->fd = fd;
+	return 0;
+}
+
 int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 {
 	struct fscache_cookie *cookie = object->cookie;
@@ -356,3 +382,11 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 					    CACHEFILES_OP_OPEN, data_len,
 					    init_open_req, NULL);
 }
+
+void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
+{
+	cachefiles_ondemand_send_req(object,
+				     CACHEFILES_OP_CLOSE,
+				     sizeof(struct cachefiles_close),
+				     init_close_req, NULL);
+}
diff --git a/include/uapi/linux/cachefiles.h b/include/uapi/linux/cachefiles.h
index 49cb7adb439a..dba97d284899 100644
--- a/include/uapi/linux/cachefiles.h
+++ b/include/uapi/linux/cachefiles.h
@@ -12,6 +12,7 @@
 
 enum cachefiles_opcode {
 	CACHEFILES_OP_OPEN,
+	CACHEFILES_OP_CLOSE,
 };
 
 /*
@@ -36,4 +37,8 @@ struct cachefiles_open {
 	__u8  data[];
 };
 
+struct cachefiles_close {
+	__u32 fd;
+};
+
 #endif
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

