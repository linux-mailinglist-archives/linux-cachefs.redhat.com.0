Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F34E7319
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 13:23:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-KkYFCSSePwChc9v-ubF52w-1; Fri, 25 Mar 2022 08:23:05 -0400
X-MC-Unique: KkYFCSSePwChc9v-ubF52w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3FEB899ED9;
	Fri, 25 Mar 2022 12:22:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B405B406793;
	Fri, 25 Mar 2022 12:22:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72F35194035F;
	Fri, 25 Mar 2022 12:22:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 368B0194035B for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 12:22:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7063D40D016C; Fri, 25 Mar 2022 12:22:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AD4840D0176
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1178B899ED0
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 12:22:40 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-5hqeZo6kMAySGQILNXevlg-1; Fri, 25 Mar 2022 08:22:35 -0400
X-MC-Unique: 5hqeZo6kMAySGQILNXevlg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V89aFr5_1648210950
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V89aFr5_1648210950) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Mar 2022 20:22:31 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 25 Mar 2022 20:22:05 +0800
Message-Id: <20220325122223.102958-5-jefflexu@linux.alibaba.com>
In-Reply-To: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v6 04/22] cachefiles: notify user daemon
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
 fs/cachefiles/internal.h        |  3 +++
 fs/cachefiles/ondemand.c        | 27 +++++++++++++++++++++++++++
 include/uapi/linux/cachefiles.h |  5 +++++
 4 files changed, 37 insertions(+)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index ae93cee9d25d..c5b8fefd4ccc 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -322,6 +322,8 @@ static void cachefiles_commit_object(struct cachefiles_object *object,
 static void cachefiles_clean_up_object(struct cachefiles_object *object,
 				       struct cachefiles_cache *cache)
 {
+	cachefiles_ondemand_cleanup_object(object);
+
 	if (test_bit(FSCACHE_COOKIE_RETIRED, &object->cookie->flags)) {
 		if (!test_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags)) {
 			cachefiles_see_object(object, cachefiles_obj_see_clean_delete);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 8a0f1b691aca..c80b519a887b 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -280,6 +280,7 @@ extern int cachefiles_ondemand_cinit(struct cachefiles_cache *cache,
 				     char *args);
 
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
+extern void cachefiles_ondemand_cleanup_object(struct cachefiles_object *object);
 
 #else
 ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
@@ -292,6 +293,8 @@ static inline int cachefiles_ondemand_init_object(struct cachefiles_object *obje
 {
 	return 0;
 }
+
+static inline void cachefiles_ondemand_cleanup_object(struct cachefiles_object *object) {}
 #endif
 
 /*
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 0742c4a7797a..7fd518e01e5a 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -199,6 +199,12 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
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
@@ -322,6 +328,19 @@ static int init_open_req(struct cachefiles_req *req, void *private)
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
+	load->fd = fd;
+	return 0;
+}
+
 int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 {
 	struct fscache_cookie *cookie = object->cookie;
@@ -346,3 +365,11 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 					    CACHEFILES_OP_OPEN, data_len,
 					    init_open_req, NULL);
 }
+
+void cachefiles_ondemand_cleanup_object(struct cachefiles_object *object)
+{
+	cachefiles_ondemand_send_req(object,
+				     CACHEFILES_OP_CLOSE,
+				     sizeof(struct cachefiles_close),
+				     init_close_req, NULL);
+}
diff --git a/include/uapi/linux/cachefiles.h b/include/uapi/linux/cachefiles.h
index 0c44d68be6bd..03047e4b7df2 100644
--- a/include/uapi/linux/cachefiles.h
+++ b/include/uapi/linux/cachefiles.h
@@ -12,6 +12,7 @@
 
 enum cachefiles_opcode {
 	CACHEFILES_OP_OPEN,
+	CACHEFILES_OP_CLOSE,
 };
 
 /*
@@ -40,4 +41,8 @@ enum cachefiles_open_flags {
 	CACHEFILES_OPEN_WANT_CACHE_SIZE,
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

