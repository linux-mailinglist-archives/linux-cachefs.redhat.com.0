Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA64F56FF
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Apr 2022 09:56:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-gR9yO92HMDCJEx-B7CjsEw-1; Wed, 06 Apr 2022 03:56:32 -0400
X-MC-Unique: gR9yO92HMDCJEx-B7CjsEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0D88185A7A4;
	Wed,  6 Apr 2022 07:56:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E657CC27DB7;
	Wed,  6 Apr 2022 07:56:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 750031940376;
	Wed,  6 Apr 2022 07:56:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 180041947BBB for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 07:56:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F09464029A8; Wed,  6 Apr 2022 07:56:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD114029A2
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 07:56:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4055811E76
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 07:56:29 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-2Ldrz4x3OgCIUxol3Cv1Rg-1; Wed, 06 Apr 2022 03:56:26 -0400
X-MC-Unique: 2Ldrz4x3OgCIUxol3Cv1Rg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V9L0qpr_1649231780
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9L0qpr_1649231780) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 06 Apr 2022 15:56:21 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  6 Apr 2022 15:55:57 +0800
Message-Id: <20220406075612.60298-6-jefflexu@linux.alibaba.com>
In-Reply-To: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v8 05/20] cachefiles: implement on-demand
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
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement the data plane of on-demand read mode.

A new NETFS_READ_HOLE_ONDEMAND flag is introduced to indicate that
on-demand read should be done when a cache miss encountered. In this
case, the read routine will send a READ request to user daemon, along
with the anonymous fd and the file range that shall be read. Now user
daemon is responsible for fetching data in the given file range, and
then writing the fetched data into cache file with the given anonymous
fd.

After sending the READ request, the read routine will hang there, until
the READ request is handled by user daemon. Then it will retry to read
from the same file range. If a cache miss is encountered again on the
same file range, the read routine will fail then.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h        |  9 ++++
 fs/cachefiles/io.c              | 11 +++++
 fs/cachefiles/ondemand.c        | 83 +++++++++++++++++++++++++++++++++
 include/linux/netfs.h           |  1 +
 include/uapi/linux/cachefiles.h | 18 +++++++
 5 files changed, 122 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 8a397d4da560..b4a834671b6b 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -281,6 +281,9 @@ extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
 extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 
+extern int cachefiles_ondemand_read(struct cachefiles_object *object,
+				    loff_t pos, size_t len);
+
 #else
 static inline ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 					char __user *_buffer, size_t buflen)
@@ -296,6 +299,12 @@ static inline int cachefiles_ondemand_init_object(struct cachefiles_object *obje
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
index 50a14e8f0aac..6f2e20cd41f4 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -95,6 +95,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 	       file, file_inode(file)->i_ino, start_pos, len,
 	       i_size_read(file_inode(file)));
 
+retry:
 	/* If the caller asked us to seek for data before doing the read, then
 	 * we should do that now.  If we find a gap, we fill it with zeros.
 	 */
@@ -119,6 +120,16 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 			if (read_hole == NETFS_READ_HOLE_FAIL)
 				goto presubmission_error;
 
+			if (read_hole == NETFS_READ_HOLE_ONDEMAND) {
+				ret = cachefiles_ondemand_read(object, off, len);
+				if (ret)
+					goto presubmission_error;
+
+				/* fail the read if no progress achieved */
+				read_hole = NETFS_READ_HOLE_FAIL;
+				goto retry;
+			}
+
 			iov_iter_zero(len, iter);
 			skipped = len;
 			ret = 0;
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index defd65124052..149ae1923955 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -11,13 +11,30 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 					  struct file *file)
 {
 	struct cachefiles_object *object = file->private_data;
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct xarray *xa = &cache->reqs;
+	struct cachefiles_req *req;
+	unsigned long index;
 
+	xa_lock(xa);
 	/*
 	 * Uninstall anon_fd to the cachefiles object, so that no further
 	 * associated requests will get enqueued.
 	 */
 	object->fd = -1;
 
+	/*
+	 * Flush all pending READ requests since their completion depends on
+	 * anon_fd.
+	 */
+	xa_for_each(xa, index, req) {
+		if (req->msg.opcode == CACHEFILES_OP_READ) {
+			req->error = -EIO;
+			complete(&req->done);
+		}
+	}
+	xa_unlock(xa);
+
 	cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
 	return 0;
 }
@@ -61,11 +78,35 @@ static loff_t cachefiles_ondemand_fd_llseek(struct file *filp, loff_t pos,
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
+	if (ioctl != CACHEFILES_IOC_CREAD)
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
@@ -283,6 +324,13 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
 			goto out;
 		}
 
+		/* recheck anon_fd for READ request with lock held */
+		if (opcode == CACHEFILES_OP_READ && object->fd == -1) {
+			xas_unlock(&xas);
+			ret = -EIO;
+			goto out;
+		}
+
 		xas.xa_index = 0;
 		xas_find_marked(&xas, UINT_MAX, XA_FREE_MARK);
 		if (xas.xa_node == XAS_RESTART)
@@ -362,6 +410,30 @@ static int init_close_req(struct cachefiles_req *req, void *private)
 	return 0;
 }
 
+struct cachefiles_read_ctx {
+	loff_t off;
+	size_t len;
+};
+
+static int init_read_req(struct cachefiles_req *req, void *private)
+{
+	struct cachefiles_object *object = req->object;
+	struct cachefiles_read *load = (void *)&req->msg.data;
+	struct cachefiles_read_ctx *read_ctx = private;
+	int fd = object->fd;
+
+	/* Stop enqueuing request when daemon closes anon_fd prematurely. */
+	if (fd == -1) {
+		pr_info_once("READ: anonymous fd closed prematurely.\n");
+		return -EIO;
+	}
+
+	load->off = read_ctx->off;
+	load->len = read_ctx->len;
+	load->fd  = fd;
+	return 0;
+}
+
 int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 {
 	struct fscache_cookie *cookie = object->cookie;
@@ -394,3 +466,14 @@ void cachefiles_ondemand_clean_object(struct cachefiles_object *object)
 				     sizeof(struct cachefiles_close),
 				     init_close_req, NULL);
 }
+
+int cachefiles_ondemand_read(struct cachefiles_object *object,
+			     loff_t pos, size_t len)
+{
+	struct cachefiles_read_ctx read_ctx = {pos, len};
+
+	return cachefiles_ondemand_send_req(object,
+					    CACHEFILES_OP_READ,
+					    sizeof(struct cachefiles_read),
+					    init_read_req, &read_ctx);
+}
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c7bf1eaf51d5..c1854e92333e 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -222,6 +222,7 @@ enum netfs_read_from_hole {
 	NETFS_READ_HOLE_IGNORE,
 	NETFS_READ_HOLE_CLEAR,
 	NETFS_READ_HOLE_FAIL,
+	NETFS_READ_HOLE_ONDEMAND,
 };
 
 /*
diff --git a/include/uapi/linux/cachefiles.h b/include/uapi/linux/cachefiles.h
index 73397e142ab3..9506b1697e14 100644
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
@@ -51,4 +53,20 @@ struct cachefiles_close {
 	__u32 fd;
 };
 
+/*
+ * @off identifies the starting offset of the requested file range.
+ * @len identifies the length of the requested file range.
+ */
+struct cachefiles_read {
+	__u64 off;
+	__u64 len;
+	__u32 fd;
+};
+
+/*
+ * Reply for READ request (Completion for READ)
+ * arg for CACHEFILES_IOC_CREAD ioctl is the @id field of READ request.
+ */
+#define CACHEFILES_IOC_CREAD	_IOW(0x98, 1, int)
+
 #endif
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

