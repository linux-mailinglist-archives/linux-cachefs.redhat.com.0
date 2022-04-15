Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934A502A0C
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Apr 2022 14:36:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-y_H84fnMNQW3qdveqj_aQQ-1; Fri, 15 Apr 2022 08:36:33 -0400
X-MC-Unique: y_H84fnMNQW3qdveqj_aQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98D9E1C06916;
	Fri, 15 Apr 2022 12:36:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EBDEC44AFB;
	Fri, 15 Apr 2022 12:36:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14DB61940356;
	Fri, 15 Apr 2022 12:36:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9518519451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 12:36:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A07A145B981; Fri, 15 Apr 2022 12:36:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 742D4145B97B
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C8A6296A62C
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:31 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-mWPp8WfcM3aj8u1jp210sA-1; Fri, 15 Apr 2022 08:36:25 -0400
X-MC-Unique: mWPp8WfcM3aj8u1jp210sA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VA7VPPx_1650026179
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VA7VPPx_1650026179) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Apr 2022 20:36:20 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 15 Apr 2022 20:35:56 +0800
Message-Id: <20220415123614.54024-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH v9 03/21] cachefiles: unbind cachefiles
 gracefully in on-demand mode
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
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a refcount to avoid the deadlock in on-demand read mode. The
on-demand read mode will pin the corresponding cachefiles object for
each anonymous fd. The cachefiles object is unpinned when the anonymous
fd gets closed. When the user daemon exits and the fd of
"/dev/cachefiles" device node gets closed, it will wait for all
cahcefiles objects gets withdrawn. Then if there's any anonymous fd
getting closed after the fd of the device node, the user daemon will
hang forever, waiting for all objects getting withdrawn.

To fix this, add a refcount indicating if there's any object pinned by
anonymous fds. The cachefiles cache gets unbound and withdrawn when the
refcount decreased to 0. It won't change the behaviour of the original
mode, in which case the cachefiles cache gets unbound and withdrawn as
long as the fd of the device node gets closed. Besides, kref_get() is
adequate whilst kref_get_unless_zero() is not needed here, since no more
anonymous fd will be created when the .release() callback of the device
node fd has already been called.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   | 24 +++++++++++++++++++++---
 fs/cachefiles/internal.h |  3 +++
 fs/cachefiles/ondemand.c |  3 +++
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 69ca22aa6abf..2e946e4eb65a 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -111,6 +111,7 @@ static int cachefiles_daemon_open(struct inode *inode, struct file *file)
 	INIT_LIST_HEAD(&cache->volumes);
 	INIT_LIST_HEAD(&cache->object_list);
 	spin_lock_init(&cache->object_list_lock);
+	kref_init(&cache->unbind_pincount);
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	xa_init_flags(&cache->reqs, XA_FLAGS_ALLOC);
 	xa_init_flags(&cache->ondemand_ids, XA_FLAGS_ALLOC1);
@@ -157,6 +158,25 @@ static void cachefiles_flush_reqs(struct cachefiles_cache *cache)
 }
 #endif
 
+static void cachefiles_release_cache(struct kref *kref)
+{
+	struct cachefiles_cache *cache;
+
+	cache = container_of(kref, struct cachefiles_cache, unbind_pincount);
+	cachefiles_daemon_unbind(cache);
+	kfree(cache);
+}
+
+void cachefiles_put_unbind_pincount(struct cachefiles_cache *cache)
+{
+	kref_put(&cache->unbind_pincount, cachefiles_release_cache);
+}
+
+void cachefiles_get_unbind_pincount(struct cachefiles_cache *cache)
+{
+	kref_get(&cache->unbind_pincount);
+}
+
 /*
  * Release a cache.
  */
@@ -173,14 +193,12 @@ static int cachefiles_daemon_release(struct inode *inode, struct file *file)
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	cachefiles_flush_reqs(cache);
 #endif
-	cachefiles_daemon_unbind(cache);
-
 	/* clean up the control file interface */
 	cache->cachefilesd = NULL;
 	file->private_data = NULL;
 	cachefiles_open = 0;
 
-	kfree(cache);
+	cachefiles_put_unbind_pincount(cache);
 
 	_leave("");
 	return 0;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 8ebe238af20b..9b83d8c82709 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -109,6 +109,7 @@ struct cachefiles_cache {
 	char				*rootdirname;	/* name of cache root directory */
 	char				*secctx;	/* LSM security context */
 	char				*tag;		/* cache binding tag */
+	struct kref			unbind_pincount;/* refcount to do daemon unbind */
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	struct xarray			reqs;		/* xarray of pending on-demand requests */
 	struct xarray			ondemand_ids;	/* xarray for ondemand_id allocation */
@@ -167,6 +168,8 @@ extern int cachefiles_has_space(struct cachefiles_cache *cache,
  * daemon.c
  */
 extern const struct file_operations cachefiles_daemon_fops;
+extern void cachefiles_get_unbind_pincount(struct cachefiles_cache *cache);
+extern void cachefiles_put_unbind_pincount(struct cachefiles_cache *cache);
 
 /*
  * error_inject.c
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 890cd3ecc2f0..eec883640efa 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -14,6 +14,7 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 	object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
 	xa_erase(&cache->ondemand_ids, object_id);
 	cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
+	cachefiles_put_unbind_pincount(cache);
 	return 0;
 }
 
@@ -169,6 +170,8 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 	load->fd = fd;
 	req->msg.object_id = object_id;
 	object->ondemand_id = object_id;
+
+	cachefiles_get_unbind_pincount(cache);
 	return 0;
 
 err_put_fd:
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

