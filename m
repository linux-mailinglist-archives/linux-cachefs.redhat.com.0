Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69950DFDB
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Apr 2022 14:22:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-eVBDIkNSMXea9bGhLfRRGg-1; Mon, 25 Apr 2022 08:22:03 -0400
X-MC-Unique: eVBDIkNSMXea9bGhLfRRGg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0DF029AA3B4;
	Mon, 25 Apr 2022 12:22:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A39FA463DFF;
	Mon, 25 Apr 2022 12:22:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 864261940346;
	Mon, 25 Apr 2022 12:22:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 80BAF1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Apr 2022 12:22:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5DB664066C9F; Mon, 25 Apr 2022 12:22:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5914F409B3E3
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37247381D8A9
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:01 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-IPCIiqopPuq5oH5rCkHNAA-1; Mon, 25 Apr 2022 08:21:59 -0400
X-MC-Unique: IPCIiqopPuq5oH5rCkHNAA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VBDrnTw_1650889312
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VBDrnTw_1650889312) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 25 Apr 2022 20:21:53 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 25 Apr 2022 20:21:27 +0800
Message-Id: <20220425122143.56815-6-jefflexu@linux.alibaba.com>
In-Reply-To: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
References: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v10 05/21] cachefiles: implement on-demand
 read
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
Cc: zhujia.zj@bytedance.com, gregkh@linuxfoundation.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, bo.liu@linux.alibaba.com,
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

Implement the data plane of on-demand read mode.

The early implementation [1] place the entry to
cachefiles_ondemand_read() in fscache_read(). However, fscache_read()
can only detect if the requested file range is fully cache miss, whilst
we need to notify the user daemon as long as there's a hole inside the
requested file range.

Thus the entry is now placed in cachefiles_prepare_read(). When working
in on-demand read mode, once a hole detected, the read routine will send
a READ request to the user daemon. The user daemon needs to fetch the
data and write it to the cache file. After sending the READ request, the
read routine will hang there, until the READ request is handled by the
user daemon. Then it will retry to read from the same file range. If no
progress encountered, the read routine will fail then.

A new NETFS_SREQ_ONDEMAND flag is introduced to indicate that on-demand
read should be done when a cache miss encountered.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
[1] https://lore.kernel.org/all/20220406075612.60298-6-jefflexu@linux.alibaba.com/ #v8
Acked-by: David Howells <dhowells@redhat.com>
---
 fs/cachefiles/internal.h        |  9 ++++
 fs/cachefiles/io.c              | 15 ++++++-
 fs/cachefiles/ondemand.c        | 77 +++++++++++++++++++++++++++++++++
 include/linux/netfs.h           |  1 +
 include/uapi/linux/cachefiles.h | 17 ++++++++
 5 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index da388ba127eb..6cba2c6de2f9 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -292,6 +292,9 @@ extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
 extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 
+extern int cachefiles_ondemand_read(struct cachefiles_object *object,
+				    loff_t pos, size_t len);
+
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
@@ -307,6 +310,12 @@ static inline int cachefiles_ondemand_init_object(struct cachefiles_object *obje
 static inline void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
 {
 }
+
+static inline int cachefiles_ondemand_read(struct cachefiles_object *object,
+					   loff_t pos, size_t len)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 /*
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 50a14e8f0aac..000a28f46e59 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -403,6 +403,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 	enum netfs_io_source ret = NETFS_DOWNLOAD_FROM_SERVER;
 	loff_t off, to;
 	ino_t ino = file ? file_inode(file)->i_ino : 0;
+	int rc;
 
 	_enter("%zx @%llx/%llx", subreq->len, subreq->start, i_size);
 
@@ -415,7 +416,8 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
 		__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
 		why = cachefiles_trace_read_no_data;
-		goto out_no_object;
+		if (!test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags))
+			goto out_no_object;
 	}
 
 	/* The object and the file may be being created in the background. */
@@ -432,7 +434,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 	object = cachefiles_cres_object(cres);
 	cache = object->volume->cache;
 	cachefiles_begin_secure(cache, &saved_cred);
-
+retry:
 	off = cachefiles_inject_read_error();
 	if (off == 0)
 		off = vfs_llseek(file, subreq->start, SEEK_DATA);
@@ -483,6 +485,15 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 
 download_and_store:
 	__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
+	if (test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags)) {
+		rc = cachefiles_ondemand_read(object, subreq->start,
+					      subreq->len);
+		if (!rc) {
+			__clear_bit(NETFS_SREQ_ONDEMAND, &subreq->flags);
+			goto retry;
+		}
+		ret = NETFS_INVALID_READ;
+	}
 out:
 	cachefiles_end_secure(cache, saved_cred);
 out_no_object:
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 11b1c15ac697..3470d4e8f0cb 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -10,8 +10,25 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 	struct cachefiles_object *object = file->private_data;
 	struct cachefiles_cache *cache = object->volume->cache;
 	int object_id = object->ondemand_id;
+	struct cachefiles_req *req;
+	XA_STATE(xas, &cache->reqs, 0);
 
+	xa_lock(&cache->reqs);
 	object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
+
+	/*
+	 * Flush all pending READ requests since their completion depends on
+	 * anon_fd.
+	 */
+	xas_for_each(&xas, req, ULONG_MAX) {
+		if (req->msg.opcode == CACHEFILES_OP_READ) {
+			req->error = -EIO;
+			complete(&req->done);
+			xas_store(&xas, NULL);
+		}
+	}
+	xa_unlock(&cache->reqs);
+
 	xa_erase(&cache->ondemand_ids, object_id);
 	cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
 	cachefiles_put_unbind_pincount(cache);
@@ -57,11 +74,35 @@ static loff_t cachefiles_ondemand_fd_llseek(struct file *filp, loff_t pos,
 	return vfs_llseek(file, pos, whence);
 }
 
+static long cachefiles_ondemand_fd_ioctl(struct file *filp, unsigned int ioctl,
+					 unsigned long arg)
+{
+	struct cachefiles_object *object = filp->private_data;
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct cachefiles_req *req;
+	unsigned long id;
+
+	if (ioctl != CACHEFILES_IOC_READ_COMPLETE)
+		return -EINVAL;
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return -EOPNOTSUPP;
+
+	id = arg;
+	req = xa_erase(&cache->reqs, id);
+	if (!req)
+		return -EINVAL;
+
+	complete(&req->done);
+	return 0;
+}
+
 static const struct file_operations cachefiles_ondemand_fd_fops = {
 	.owner		= THIS_MODULE,
 	.release	= cachefiles_ondemand_fd_release,
 	.write_iter	= cachefiles_ondemand_fd_write_iter,
 	.llseek		= cachefiles_ondemand_fd_llseek,
+	.unlocked_ioctl	= cachefiles_ondemand_fd_ioctl,
 };
 
 /*
@@ -388,6 +429,32 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 	return 0;
 }
 
+struct cachefiles_read_ctx {
+	loff_t off;
+	size_t len;
+};
+
+static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
+					     void *private)
+{
+	struct cachefiles_object *object = req->object;
+	struct cachefiles_read *load = (void *)req->msg.data;
+	struct cachefiles_read_ctx *read_ctx = private;
+	int object_id = object->ondemand_id;
+
+	/* Stop enqueuing requests when daemon has closed anon_fd. */
+	if (object_id <= 0) {
+		WARN_ON_ONCE(object_id == 0);
+		pr_info_once("READ: anonymous fd closed prematurely.\n");
+		return -EIO;
+	}
+
+	req->msg.object_id = object_id;
+	load->off = read_ctx->off;
+	load->len = read_ctx->len;
+	return 0;
+}
+
 int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 {
 	struct fscache_cookie *cookie = object->cookie;
@@ -417,3 +484,13 @@ void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
 	cachefiles_ondemand_send_req(object, CACHEFILES_OP_CLOSE, 0,
 			cachefiles_ondemand_init_close_req, NULL);
 }
+
+int cachefiles_ondemand_read(struct cachefiles_object *object,
+			     loff_t pos, size_t len)
+{
+	struct cachefiles_read_ctx read_ctx = {pos, len};
+
+	return cachefiles_ondemand_send_req(object, CACHEFILES_OP_READ,
+			sizeof(struct cachefiles_read),
+			cachefiles_ondemand_init_read_req, &read_ctx);
+}
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c7bf1eaf51d5..057d04efaf79 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -159,6 +159,7 @@ struct netfs_io_subrequest {
 #define NETFS_SREQ_SHORT_IO		2	/* Set if the I/O was short */
 #define NETFS_SREQ_SEEK_DATA_READ	3	/* Set if ->read() should SEEK_DATA first */
 #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
+#define NETFS_SREQ_ONDEMAND		5	/* Set if it's from on-demand read mode */
 };
 
 enum netfs_io_origin {
diff --git a/include/uapi/linux/cachefiles.h b/include/uapi/linux/cachefiles.h
index 37a0071037c8..78caa73e5343 100644
--- a/include/uapi/linux/cachefiles.h
+++ b/include/uapi/linux/cachefiles.h
@@ -3,6 +3,7 @@
 #define _LINUX_CACHEFILES_H
 
 #include <linux/types.h>
+#include <linux/ioctl.h>
 
 /*
  * Fscache ensures that the maximum length of cookie key is 255. The volume key
@@ -13,6 +14,7 @@
 enum cachefiles_opcode {
 	CACHEFILES_OP_OPEN,
 	CACHEFILES_OP_CLOSE,
+	CACHEFILES_OP_READ,
 };
 
 /*
@@ -48,4 +50,19 @@ struct cachefiles_open {
 	__u8  data[];
 };
 
+/*
+ * @off		indicates the starting offset of the requested file range
+ * @len		indicates the length of the requested file range
+ */
+struct cachefiles_read {
+	__u64 off;
+	__u64 len;
+};
+
+/*
+ * Reply for READ request
+ * @arg for this ioctl is the @id field of READ request.
+ */
+#define CACHEFILES_IOC_READ_COMPLETE	_IOW(0x98, 1, int)
+
 #endif
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

