Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 897844CFE92
	for <lists+linux-cachefs@lfdr.de>; Mon,  7 Mar 2022 13:33:27 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-M5tvh8d9MkeatwcICqez5A-1; Mon, 07 Mar 2022 07:33:23 -0500
X-MC-Unique: M5tvh8d9MkeatwcICqez5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D41A1381078D;
	Mon,  7 Mar 2022 12:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2ADA40CFD1D;
	Mon,  7 Mar 2022 12:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 597461930593;
	Mon,  7 Mar 2022 12:33:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8AD041931BDD for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  7 Mar 2022 12:33:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B43A5805AA; Mon,  7 Mar 2022 12:33:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 574FD5805A9
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F1AE80231F
 for <linux-cachefs@redhat.com>; Mon,  7 Mar 2022 12:33:21 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-a6CkSQO9NUSvM1kqUF9lGg-1; Mon, 07 Mar 2022 07:33:19 -0500
X-MC-Unique: a6CkSQO9NUSvM1kqUF9lGg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=15; SR=0; TI=SMTPD_---0V6WEily_1646656393
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V6WEily_1646656393) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 07 Mar 2022 20:33:14 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon,  7 Mar 2022 20:32:49 +0800
Message-Id: <20220307123305.79520-6-jefflexu@linux.alibaba.com>
In-Reply-To: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
References: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v4 05/21] cachefiles: implement on-demand
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
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
 fs/cachefiles/daemon.c          | 98 +++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h        |  8 +++
 fs/cachefiles/io.c              | 11 ++++
 include/linux/netfs.h           |  1 +
 include/uapi/linux/cachefiles.h |  7 +++
 5 files changed, 125 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 72a21942aaf6..36ddf64d5e62 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -46,6 +46,7 @@ static int cachefiles_daemon_bind(struct cachefiles_cache *, char *);
 static void cachefiles_daemon_unbind(struct cachefiles_cache *);
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 static int cachefiles_ondemand_cinit(struct cachefiles_cache *, char *);
+static int cachefiles_ondemand_cread(struct cachefiles_cache *, char *);
 #endif
 
 static unsigned long cachefiles_open;
@@ -81,6 +82,7 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "tag",	cachefiles_daemon_tag		},
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	{ "cinit",	cachefiles_ondemand_cinit	},
+	{ "cread",	cachefiles_ondemand_cread	},
 #endif
 	{ "",		NULL				}
 };
@@ -139,6 +141,9 @@ bool cachefiles_ondemand_daemon_bind(struct cachefiles_cache *cache, char *args)
 static int cachefiles_ondemand_fd_release(struct inode *inode, struct file *file)
 {
 	struct cachefiles_object *object = file->private_data;
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct cachefiles_req *req;
+	unsigned long index;
 
 	/*
 	 * Uninstall anon_fd to the cachefiles object, so that no further
@@ -146,6 +151,15 @@ static int cachefiles_ondemand_fd_release(struct inode *inode, struct file *file
 	 */
 	object->fd = -1;
 
+	/* complete all associated pending requests */
+	xa_for_each(&cache->reqs, index, req) {
+		if (req->object == object &&
+		    req->msg.opcode == CACHEFILES_OP_READ) {
+			req->error = -EIO;
+			complete(&req->done);
+		}
+	}
+
 	cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
 	return 0;
 }
@@ -261,6 +275,36 @@ static int cachefiles_ondemand_cinit(struct cachefiles_cache *cache, char *args)
 	return ret;
 }
 
+/*
+ * Read request completion
+ * - command: "cread <id>"
+ */
+static int cachefiles_ondemand_cread(struct cachefiles_cache *cache, char *args)
+{
+	struct cachefiles_req *req;
+	unsigned long id;
+	int ret;
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return -EOPNOTSUPP;
+
+	if (!*args) {
+		pr_err("Empty id specified\n");
+		return -EINVAL;
+	}
+
+	ret = kstrtoul(args, 0, &id);
+	if (ret)
+		return ret;
+
+	req = xa_erase(&cache->reqs, id);
+	if (!req)
+		return -EINVAL;
+
+	complete(&req->done);
+	return 0;
+}
+
 static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 {
 	struct cachefiles_init *init;
@@ -460,6 +504,60 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 	return ret;
 }
 
+static struct cachefiles_req *
+cachefiles_alloc_read_req(struct cachefiles_object *object,
+			  loff_t pos, size_t len)
+{
+	struct cachefiles_req *req;
+	struct cachefiles_read *read;
+	int fd = object->fd;
+
+	/* Stop enqueuig request when daemon closes anon_fd prematurely. */
+	if (WARN_ON_ONCE(fd == -1))
+		return NULL;
+
+	req = cachefiles_alloc_req(object, CACHEFILES_OP_READ, sizeof(*read));
+	if (!req)
+		return NULL;
+
+	read = (void *)&req->msg.data;
+	read->off = pos;
+	read->len = len;
+	read->fd  = fd;
+
+	return req;
+}
+
+int cachefiles_ondemand_read(struct cachefiles_object *object,
+			     loff_t pos, size_t len)
+{
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct cachefiles_req *req;
+	int ret;
+
+	ret = cachefiles_ondemand_check(cache);
+	if (ret)
+		return ret;
+
+	req = cachefiles_alloc_read_req(object, pos, len);
+	if (!req)
+		return -ENOMEM;
+
+	/*
+	 * 1) Checking object->fd and 2) enqueuing request into xarray, is not
+	 * atomic as a whole here. Thus similarly, when anon_fd is closed, it's
+	 * possible that a new request may be enqueued into xarray, after
+	 * associated requests in xarray have already been flushed. But it won't
+	 * cause infinite hang since user daemon will still fetch and handle
+	 * this request. And since the anon_fd has alrady been closed, any
+	 * following file operation with this anon_fd will fail in this case.
+	 */
+	ret = cachefiles_ondemand_send_req(cache, req);
+
+	kfree(req);
+	return ret;
+}
+
 #else
 static inline void cachefiles_ondemand_open(struct cachefiles_cache *cache) {}
 static inline void cachefiles_ondemand_release(struct cachefiles_cache *cache) {}
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 8450ebd77949..5f336ec15cea 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -167,6 +167,8 @@ extern const struct file_operations cachefiles_daemon_fops;
 
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
+extern int cachefiles_ondemand_read(struct cachefiles_object *object,
+				    loff_t pos, size_t len);
 
 #else
 static inline
@@ -174,6 +176,12 @@ int cachefiles_ondemand_init_object(struct cachefiles_object *object)
 {
 	return 0;
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
index 8dbc1eb254a3..ee1283ba7a2c 100644
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
+				if (!cachefiles_ondemand_read(object, off, len)) {
+					/* fail the read if no progress achieved */
+					read_hole = NETFS_READ_HOLE_FAIL;
+					goto retry;
+				}
+
+				goto presubmission_error;
+			}
+
 			iov_iter_zero(len, iter);
 			skipped = len;
 			ret = 0;
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 614f22213e21..2a9c50d3a928 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -203,6 +203,7 @@ enum netfs_read_from_hole {
 	NETFS_READ_HOLE_IGNORE,
 	NETFS_READ_HOLE_CLEAR,
 	NETFS_READ_HOLE_FAIL,
+	NETFS_READ_HOLE_ONDEMAND,
 };
 
 /*
diff --git a/include/uapi/linux/cachefiles.h b/include/uapi/linux/cachefiles.h
index 759fb6693d75..88a78e9d001f 100644
--- a/include/uapi/linux/cachefiles.h
+++ b/include/uapi/linux/cachefiles.h
@@ -8,6 +8,7 @@
 
 enum cachefiles_opcode {
 	CACHEFILES_OP_INIT,
+	CACHEFILES_OP_READ,
 };
 
 /*
@@ -38,4 +39,10 @@ enum cachefiles_init_flags {
 
 #define CACHEFILES_INIT_FL_WANT_CACHE_SIZE	(1 << CACHEFILES_INIT_WANT_CACHE_SIZE)
 
+struct cachefiles_read {
+	__u64 off;
+	__u64 len;
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

