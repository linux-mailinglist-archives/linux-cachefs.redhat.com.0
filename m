Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FAF4DB0F1
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Mar 2022 14:17:54 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-X3XD-k6bMyyBRcuT2UXzvQ-1; Wed, 16 Mar 2022 09:17:50 -0400
X-MC-Unique: X3XD-k6bMyyBRcuT2UXzvQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70B1618A6583;
	Wed, 16 Mar 2022 13:17:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA061434840;
	Wed, 16 Mar 2022 13:17:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B3B21940344;
	Wed, 16 Mar 2022 13:17:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D110019451ED for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Mar 2022 13:17:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0C8430B9D; Wed, 16 Mar 2022 13:17:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC6402EFB0
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 13:17:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13A0A80281B
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 13:17:38 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-Sv9osUScMUyEOFMz3XBZKQ-1; Wed, 16 Mar 2022 09:17:35 -0400
X-MC-Unique: Sv9osUScMUyEOFMz3XBZKQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7N0RUg_1647436649
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7N0RUg_1647436649) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Mar 2022 21:17:30 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed, 16 Mar 2022 21:17:05 +0800
Message-Id: <20220316131723.111553-5-jefflexu@linux.alibaba.com>
In-Reply-To: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH v5 04/22] cachefiles: notify user daemon
 with anon_fd when looking up cookie
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
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Send the anonymous fd to user daemon when looking up cookie, no matter
whether the cache file exist there or not. With the given anonymous fd,
user daemon can fetch and then write data into cache file in advance,
even when cache miss has not happended yet.

Also add one advisory flag (FSCACHE_ADV_WANT_CACHE_SIZE) suggesting that
cache file size shall be retrieved at runtime. This helps the scenario
where one cache file can contain multiple netfs files for the purpose of
deduplication, e.g. In this case, netfs itself has no idea the cache
file size, whilst user daemon needs to offer the hint on the cache file
size.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c            | 365 +++++++++++++++++++++++++++++-
 fs/cachefiles/internal.h          |  24 ++
 fs/cachefiles/namei.c             |  16 +-
 include/linux/fscache.h           |   1 +
 include/trace/events/cachefiles.h |   2 +
 include/uapi/linux/cachefiles.h   |  39 ++++
 6 files changed, 444 insertions(+), 3 deletions(-)
 create mode 100644 include/uapi/linux/cachefiles.h

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index c0c3a3cbee28..3c3a461f8cd8 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -19,6 +19,8 @@
 #include <linux/ctype.h>
 #include <linux/string.h>
 #include <linux/fs_struct.h>
+#include <linux/fdtable.h>
+#include <linux/anon_inodes.h>
 #include "internal.h"
 
 static int cachefiles_daemon_open(struct inode *, struct file *);
@@ -43,6 +45,9 @@ static int cachefiles_daemon_secctx(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_tag(struct cachefiles_cache *, char *);
 static int cachefiles_daemon_bind(struct cachefiles_cache *, char *);
 static void cachefiles_daemon_unbind(struct cachefiles_cache *);
+#ifdef CONFIG_CACHEFILES_ONDEMAND
+static int cachefiles_ondemand_cinit(struct cachefiles_cache *, char *);
+#endif
 
 static unsigned long cachefiles_open;
 
@@ -75,6 +80,9 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "inuse",	cachefiles_daemon_inuse		},
 	{ "secctx",	cachefiles_daemon_secctx	},
 	{ "tag",	cachefiles_daemon_tag		},
+#ifdef CONFIG_CACHEFILES_ONDEMAND
+	{ "cinit",	cachefiles_ondemand_cinit	},
+#endif
 	{ "",		NULL				}
 };
 
@@ -87,6 +95,21 @@ static inline void cachefiles_ondemand_open(struct cachefiles_cache *cache)
 
 static inline void cachefiles_ondemand_release(struct cachefiles_cache *cache)
 {
+	struct cachefiles_req *req;
+	unsigned long index;
+
+	/*
+	 * 1) Cache has been marked as dead state, and then 2) flush all pending
+	 * requests in @reqs xarray. The barrier inside set_bit() will ensure
+	 * that above two ops won't be reordered.
+	 */
+	write_lock(&cache->reqs_lock);
+	xa_for_each(&cache->reqs, index, req) {
+		req->error = -EIO;
+		complete(&req->done);
+	}
+	write_unlock(&cache->reqs_lock);
+
 	xa_destroy(&cache->reqs);
 }
 
@@ -114,6 +137,346 @@ bool cachefiles_ondemand_daemon_bind(struct cachefiles_cache *cache, char *args)
 	return false;
 }
 
+static int cachefiles_ondemand_fd_release(struct inode *inode, struct file *file)
+{
+	struct cachefiles_object *object = file->private_data;
+
+	/*
+	 * Uninstall anon_fd to the cachefiles object, so that no further
+	 * associated requests will get enqueued.
+	 */
+	object->fd = -1;
+
+	cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
+	return 0;
+}
+
+static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
+						 struct iov_iter *iter)
+{
+	struct cachefiles_object *object = kiocb->ki_filp->private_data;
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct file *file = object->file;
+	size_t len = iter->count;
+	loff_t pos = kiocb->ki_pos;
+	const struct cred *saved_cred;
+	int ret;
+
+	if (!file)
+		return -ENOBUFS;
+
+	cachefiles_begin_secure(cache, &saved_cred);
+	ret = __cachefiles_prepare_write(object, file, &pos, &len, true);
+	cachefiles_end_secure(cache, saved_cred);
+	if (ret < 0)
+		return ret;
+
+	ret = __cachefiles_write(object, file, pos, iter, NULL, NULL);
+	if (!ret)
+		ret = len;
+
+	return ret;
+}
+
+static loff_t cachefiles_ondemand_fd_llseek(struct file *filp, loff_t pos, int whence)
+{
+	struct cachefiles_object *object = filp->private_data;
+	struct file *file = object->file;
+
+	if (!file)
+		return -ENOBUFS;
+
+	return vfs_llseek(file, pos, whence);
+}
+
+static const struct file_operations cachefiles_ondemand_fd_fops = {
+	.owner		= THIS_MODULE,
+	.release	= cachefiles_ondemand_fd_release,
+	.write_iter	= cachefiles_ondemand_fd_write_iter,
+	.llseek		= cachefiles_ondemand_fd_llseek,
+};
+
+/*
+ * Init request completion
+ * - command: "cinit <id>[,<cache_size>]"
+ */
+static int cachefiles_ondemand_cinit(struct cachefiles_cache *cache, char *args)
+{
+	struct cachefiles_req *req;
+	struct cachefiles_open *load;
+	struct fscache_cookie *cookie;
+	char *tmp, *pid, *psize;
+	unsigned long id, flags, size = 0;
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
+	tmp = kstrdup(args, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	pid = tmp;
+	psize = strchr(tmp, ',');
+	if (psize) {
+		*psize = 0;
+		psize++;
+
+		ret = kstrtoul(psize, 0, &size);
+		if (ret)
+			goto out;
+	}
+
+	ret = kstrtoul(pid, 0, &id);
+	if (ret)
+		goto out;
+
+	req = xa_erase(&cache->reqs, id);
+	if (!req) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	load = (void *)req->msg.data;
+	flags = load->flags;
+
+	if (test_bit(CACHEFILES_OPEN_WANT_CACHE_SIZE, &flags)) {
+		if (WARN_ON_ONCE(!size)) {
+			req->error = -EINVAL;
+		} else {
+			cookie = req->object->cookie;
+			cookie->object_size = size;
+			if (size)
+				set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
+			else
+				clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
+		}
+	}
+
+	complete(&req->done);
+out:
+	kfree(tmp);
+	return ret;
+}
+
+static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
+{
+	struct cachefiles_object *object;
+	struct cachefiles_open *load;
+	struct fd f;
+	int ret;
+
+	object = cachefiles_grab_object(req->object,
+			cachefiles_obj_get_ondemand_fd);
+
+	ret = anon_inode_getfd("[cachefiles]", &cachefiles_ondemand_fd_fops,
+				object, O_WRONLY);
+	if (ret < 0) {
+		cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
+		return ret;
+	}
+
+	f = fdget_pos(ret);
+	if (WARN_ON_ONCE(!f.file))
+		return -EBADFD;
+
+	f.file->f_mode |= FMODE_PWRITE | FMODE_LSEEK;
+	fdput_pos(f);
+
+	load = (void *)req->msg.data;
+	load->fd = object->fd = ret;
+
+	return 0;
+}
+
+static ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
+					       char __user *_buffer,
+					       size_t buflen)
+{
+	struct cachefiles_req *req;
+	struct cachefiles_msg *msg;
+	unsigned long id = 0;
+	size_t n;
+	int ret = 0;
+	XA_STATE(xas, &cache->reqs, 0);
+
+	/*
+	 * Search for request that has not ever been processed, to prevent
+	 * requests from being sent to user daemon repeatedly.
+	 */
+	xa_lock(&cache->reqs);
+	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
+	if (req)
+		xas_clear_mark(&xas, CACHEFILES_REQ_NEW);
+	xa_unlock(&cache->reqs);
+
+	if (!req)
+		return 0;
+
+	msg = &req->msg;
+	msg->id = id = xas.xa_index;
+
+	n = msg->len;
+	if (n > buflen) {
+		ret = -EMSGSIZE;
+		goto error;
+	}
+
+	if (msg->opcode == CACHEFILES_OP_OPEN) {
+		ret = cachefiles_ondemand_get_fd(req);
+		if (ret)
+			goto error;
+	}
+
+	if (copy_to_user(_buffer, msg, n) != 0) {
+		ret = -EFAULT;
+		goto err_put_fd;
+	}
+
+	return n;
+
+err_put_fd:
+	if (msg->opcode == CACHEFILES_OP_OPEN)
+		close_fd(req->object->fd);
+error:
+	xa_erase(&cache->reqs, id);
+	req->error = ret;
+	complete(&req->done);
+	return ret;
+}
+
+typedef int (*init_req_fn)(struct cachefiles_req *req, void *private);
+
+static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
+					enum cachefiles_opcode opcode,
+					size_t data_len,
+					init_req_fn init_req,
+					void *private)
+{
+	struct cachefiles_cache *cache = object->volume->cache;
+	struct cachefiles_req *req;
+	struct xarray *xa = &cache->reqs;
+	int ret;
+	u32 id;
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return -EOPNOTSUPP;
+
+	if (test_bit(CACHEFILES_DEAD, &cache->flags))
+		return -EIO;
+
+	req = kzalloc(sizeof(*req) + data_len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->object = object;
+	init_completion(&req->done);
+	req->msg.opcode = opcode;
+	req->msg.len = sizeof(struct cachefiles_msg) + data_len;
+
+	ret = init_req(req, private);
+	if (ret)
+		goto out;
+
+	/*
+	 * Enqueue the pending request.
+	 *
+	 * Stop enqueuing the request when daemon is dying. So we need to
+	 * 1) check cache state, and 2) enqueue request if cache is alive.
+	 *
+	 * The above two ops need to be atomic as a whole. @reqs_lock is used
+	 * here to ensure that. Otherwise, request may be enqueued after xarray
+	 * has been flushed, in which case the orphan request will never be
+	 * completed and thus netfs will hang there forever.
+	 */
+	read_lock(&cache->reqs_lock);
+
+	/* recheck dead state under lock */
+	if (test_bit(CACHEFILES_DEAD, &cache->flags)) {
+		read_unlock(&cache->reqs_lock);
+		ret = -EIO;
+		goto out;
+	}
+
+	xa_lock(xa);
+	ret = __xa_alloc(xa, &id, req, xa_limit_32b, GFP_KERNEL);
+	if (!ret)
+		__xa_set_mark(xa, id, CACHEFILES_REQ_NEW);
+	xa_unlock(xa);
+
+	read_unlock(&cache->reqs_lock);
+
+	if (ret)
+		goto out;
+
+	wake_up_all(&cache->daemon_pollwq);
+	wait_for_completion(&req->done);
+	ret = req->error;
+out:
+	kfree(req);
+	return ret;
+}
+
+static int init_open_req(struct cachefiles_req *req, void *private)
+{
+	struct cachefiles_object *object = req->object;
+	struct fscache_cookie *cookie = object->cookie;
+	struct fscache_volume *volume = object->volume->vcookie;
+	struct cachefiles_open *load = (void *)req->msg.data;
+	size_t volume_key_len, cookie_key_len;
+	void *volume_key, *cookie_key;
+	unsigned long flags = 0;
+
+	/* volume key is of string format */
+	volume_key_len = volume->key[0] + 1;
+	volume_key = volume->key + 1;
+
+	/* cookie key is of binary format */
+	cookie_key_len = cookie->key_len;
+	cookie_key = fscache_get_key(cookie);
+
+	if (object->cookie->advice & FSCACHE_ADV_WANT_CACHE_SIZE)
+		__set_bit(CACHEFILES_OPEN_WANT_CACHE_SIZE, &flags);
+
+	load->flags = flags;
+	load->volume_key_len = volume_key_len;
+	load->cookie_key_len = cookie_key_len;
+	memcpy(load->data, volume_key, volume_key_len);
+	memcpy(load->data + volume_key_len, cookie_key, cookie_key_len);
+
+	return 0;
+}
+
+int cachefiles_ondemand_init_object(struct cachefiles_object *object)
+{
+	struct fscache_cookie *cookie = object->cookie;
+	struct fscache_volume *volume = object->volume->vcookie;
+	size_t volume_key_len, cookie_key_len, data_len;
+
+	/*
+	 * Cachefiles will firstly check cache file under the root cache
+	 * directory. If coherency check failed, it will fallback to creating a
+	 * new tmpfile as the cache file. Reuse the previously created anon_fd
+	 * if any.
+	 */
+	if (object->fd > 0)
+		return 0;
+
+	volume_key_len = volume->key[0] + 1;
+	cookie_key_len = cookie->key_len;
+	data_len = sizeof(struct cachefiles_open) +
+		   volume_key_len + cookie_key_len;
+
+	return cachefiles_ondemand_send_req(object,
+					    CACHEFILES_OP_OPEN, data_len,
+					    init_open_req, NULL);
+}
+
 #else
 static inline void cachefiles_ondemand_open(struct cachefiles_cache *cache) {}
 static inline void cachefiles_ondemand_release(struct cachefiles_cache *cache) {}
@@ -129,7 +492,6 @@ bool cachefiles_ondemand_daemon_bind(struct cachefiles_cache *cache, char *args)
 {
 	return false;
 }
-#endif
 
 static inline
 ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
@@ -137,6 +499,7 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 {
 	return -EOPNOTSUPP;
 }
+#endif
 
 /*
  * Prepare a cache for caching.
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 3f791882fa3f..8450ebd77949 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -16,6 +16,7 @@
 #include <linux/cred.h>
 #include <linux/security.h>
 #include <linux/xarray.h>
+#include <linux/cachefiles.h>
 
 #define CACHEFILES_DIO_BLOCK_SIZE 4096
 
@@ -59,6 +60,9 @@ struct cachefiles_object {
 	enum cachefiles_content		content_info:8;	/* Info about content presence */
 	unsigned long			flags;
 #define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
+#ifdef CONFIG_CACHEFILES_ONDEMAND
+	int				fd;		/* anonymous fd */
+#endif
 };
 
 /*
@@ -109,6 +113,15 @@ struct cachefiles_cache {
 #endif
 };
 
+struct cachefiles_req {
+	struct cachefiles_object *object;
+	struct completion done;
+	int error;
+	struct cachefiles_msg msg;
+};
+
+#define CACHEFILES_REQ_NEW	XA_MARK_1
+
 #include <trace/events/cachefiles.h>
 
 static inline
@@ -152,6 +165,17 @@ extern int cachefiles_has_space(struct cachefiles_cache *cache,
  */
 extern const struct file_operations cachefiles_daemon_fops;
 
+#ifdef CONFIG_CACHEFILES_ONDEMAND
+extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
+
+#else
+static inline
+int cachefiles_ondemand_init_object(struct cachefiles_object *object)
+{
+	return 0;
+}
+#endif
+
 /*
  * error_inject.c
  */
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index f256c8aff7bb..22aba4c6a762 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -444,10 +444,9 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
 	struct dentry *fan = volume->fanout[(u8)object->cookie->key_hash];
 	struct file *file;
 	struct path path;
-	uint64_t ni_size = object->cookie->object_size;
+	uint64_t ni_size;
 	long ret;
 
-	ni_size = round_up(ni_size, CACHEFILES_DIO_BLOCK_SIZE);
 
 	cachefiles_begin_secure(cache, &saved_cred);
 
@@ -473,6 +472,15 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
 		goto out_dput;
 	}
 
+	ret = cachefiles_ondemand_init_object(object);
+	if (ret < 0) {
+		file = ERR_PTR(ret);
+		goto out_dput;
+	}
+
+	ni_size = object->cookie->object_size;
+	ni_size = round_up(ni_size, CACHEFILES_DIO_BLOCK_SIZE);
+
 	if (ni_size > 0) {
 		trace_cachefiles_trunc(object, d_backing_inode(path.dentry), 0, ni_size,
 				       cachefiles_trunc_expand_tmpfile);
@@ -573,6 +581,10 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 	}
 	_debug("file -> %pd positive", dentry);
 
+	ret = cachefiles_ondemand_init_object(object);
+	if (ret < 0)
+		goto error_fput;
+
 	ret = cachefiles_check_auxdata(object, file);
 	if (ret < 0)
 		goto check_failed;
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index d2430da8aa67..a330354f33ca 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -39,6 +39,7 @@ struct fscache_cookie;
 #define FSCACHE_ADV_SINGLE_CHUNK	0x01 /* The object is a single chunk of data */
 #define FSCACHE_ADV_WRITE_CACHE		0x00 /* Do cache if written to locally */
 #define FSCACHE_ADV_WRITE_NOCACHE	0x02 /* Don't cache if written to locally */
+#define FSCACHE_ADV_WANT_CACHE_SIZE	0x04 /* Retrieve cache size at runtime */
 
 #define FSCACHE_INVAL_DIO_WRITE		0x01 /* Invalidate due to DIO write */
 
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index c6f5aa74db89..371e5816e98c 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -31,6 +31,8 @@ enum cachefiles_obj_ref_trace {
 	cachefiles_obj_see_lookup_failed,
 	cachefiles_obj_see_withdraw_cookie,
 	cachefiles_obj_see_withdrawal,
+	cachefiles_obj_get_ondemand_fd,
+	cachefiles_obj_put_ondemand_fd,
 };
 
 enum fscache_why_object_killed {
diff --git a/include/uapi/linux/cachefiles.h b/include/uapi/linux/cachefiles.h
new file mode 100644
index 000000000000..5ea7285863f1
--- /dev/null
+++ b/include/uapi/linux/cachefiles.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_CACHEFILES_H
+#define _LINUX_CACHEFILES_H
+
+#include <linux/types.h>
+
+#define CACHEFILES_MSG_MAX_SIZE	512
+
+enum cachefiles_opcode {
+	CACHEFILES_OP_OPEN,
+};
+
+/*
+ * @id		identifying position of this message in the radix tree
+ * @opcode	message type, CACHEFILE_OP_*
+ * @len		message length, including message header and following data
+ * @data	message type specific payload
+ */
+struct cachefiles_msg {
+	__u32 id;
+	__u32 opcode;
+	__u32 len;
+	__u8  data[];
+};
+
+struct cachefiles_open {
+	__u32 volume_key_len;
+	__u32 cookie_key_len;
+	__u32 fd;
+	__u32 flags;
+	/* following data contains volume_key and cookie_key in sequence */
+	__u8  data[];
+};
+
+enum cachefiles_open_flags {
+	CACHEFILES_OPEN_WANT_CACHE_SIZE,
+};
+
+#endif
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

