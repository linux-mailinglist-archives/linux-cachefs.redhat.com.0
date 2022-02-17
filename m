Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 307794B9FB0
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Feb 2022 13:06:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-sqLN3yI-OFCSORUcKGGpIw-1; Thu, 17 Feb 2022 07:06:21 -0500
X-MC-Unique: sqLN3yI-OFCSORUcKGGpIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FA34801B0D;
	Thu, 17 Feb 2022 12:06:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33BB66E1BA;
	Thu, 17 Feb 2022 12:06:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB5894CA9B;
	Thu, 17 Feb 2022 12:06:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HC2DX9026812 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 07:02:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70515145FBB1; Thu, 17 Feb 2022 12:02:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB28145FBAF
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 12:02:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 533E71C04B4A
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 12:02:13 +0000 (UTC)
Received: from out199-17.us.a.mail.aliyun.com
	(out199-17.us.a.mail.aliyun.com [47.90.199.17]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-311-L0fPen6oMdG79oR8tJzDyA-1; Thu, 17 Feb 2022 07:02:11 -0500
X-MC-Unique: L0fPen6oMdG79oR8tJzDyA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R361e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V4keWL7_1645099319
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V4keWL7_1645099319) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 17 Feb 2022 20:02:00 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 17 Feb 2022 20:01:54 +0800
Message-Id: <20220217120154.16658-5-jefflexu@linux.alibaba.com>
In-Reply-To: <20220217120154.16658-1-jefflexu@linux.alibaba.com>
References: <20220217120154.16658-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: [Linux-cachefs] [RESEND PATCH v3 4/4] cachefiles: detect backing
	file size in on-demand read mode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fscache/cachefiles used to serve as a local cache for remote fs. The
following patches will introduce a new use case, in which local
read-only fs could implement on-demand reading with fscache. Then in
this case, the upper read-only fs may has no idea on the size of the
backed file.

It is worth nothing that, in this scenario, user daemon is responsible
for preparing all backing files with correct file size in the first
beginning. (Backing files are all sparse files in this case). And since
it's read-only, we can get the backing file size at runtime as the
object size.

This patch also adds one flag bit to distinguish the new introduced
on-demand read mode from the original mode. The following patch will
introduce a user configures it.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/Kconfig    | 13 +++++++++
 fs/cachefiles/internal.h |  1 +
 fs/cachefiles/namei.c    | 60 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/Kconfig b/fs/cachefiles/Kconfig
index 719faeeda168..cef412cfd127 100644
--- a/fs/cachefiles/Kconfig
+++ b/fs/cachefiles/Kconfig
@@ -26,3 +26,16 @@ config CACHEFILES_ERROR_INJECTION
 	help
 	  This permits error injection to be enabled in cachefiles whilst a
 	  cache is in service.
+
+config CACHEFILES_ONDEMAND
+	bool "Support for on-demand reading"
+	depends on CACHEFILES
+	default n
+	help
+	  This permits on-demand read mode of cachefiles. In this mode, when
+	  cache miss, the cachefiles backend instead of the upper fs using
+	  fscache is responsible for fetching data, e.g. through user daemon.
+	  Then after the data's ready, upper fs can reinitiate a read from the
+	  cache.
+
+	  If unsure, say N.
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c793d33b0224..6473634c41a9 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -98,6 +98,7 @@ struct cachefiles_cache {
 #define CACHEFILES_DEAD			1	/* T if cache dead */
 #define CACHEFILES_CULLING		2	/* T if cull engaged */
 #define CACHEFILES_STATE_CHANGED	3	/* T if state changed (poll trigger) */
+#define CACHEFILES_ONDEMAND_MODE	4	/* T if in on-demand read mode */
 	char				*rootdirname;	/* name of cache root directory */
 	char				*secctx;	/* LSM security context */
 	char				*tag;		/* cache binding tag */
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index f256c8aff7bb..abe75b4b955f 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -510,15 +510,69 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
 	return file;
 }
 
+#ifdef CONFIG_CACHEFILES_ONDEMAND
+static inline bool cachefiles_can_create_file(struct cachefiles_cache *cache)
+{
+	/*
+	 * On-demand read mode requires that backing files have been prepared
+	 * with correct file size under corresponding directory in the very
+	 * first begginning. We can get here when the backing file doesn't exist
+	 * under corresponding directory, or the file size is unexpected 0.
+	 */
+	return !test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags);
+
+}
+
+/*
+ * Fs using fscache for on-demand reading may have no idea of the file size of
+ * backing files. Thus the on-demand read mode requires that backing files shall
+ * be prepared with correct file size under corresponding directory by the user
+ * daemon in the first beginning. Then the backend is responsible for taking the
+ * file size of the backing file as the object size at runtime.
+ */
+static int cachefiles_recheck_size(struct cachefiles_object *object,
+				   struct file *file)
+{
+	loff_t size;
+	struct cachefiles_cache *cache = object->volume->cache;
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return 0;
+
+	size = i_size_read(file_inode(file));
+	if (!size)
+		return -EINVAL;
+
+	object->cookie->object_size = size;
+	return 0;
+}
+#else
+static inline bool cachefiles_can_create_file(struct cachefiles_cache *cache)
+{
+	return true;
+}
+
+static inline int cachefiles_recheck_size(struct cachefiles_object *object,
+					  struct file *file)
+{
+	return 0;
+}
+#endif
+
+
 /*
  * Create a new file.
  */
 static bool cachefiles_create_file(struct cachefiles_object *object)
 {
+	struct cachefiles_cache *cache = object->volume->cache;
 	struct file *file;
 	int ret;
 
-	ret = cachefiles_has_space(object->volume->cache, 1, 0,
+	if (!cachefiles_can_create_file(cache))
+		return false;
+
+	ret = cachefiles_has_space(cache, 1, 0,
 				   cachefiles_has_space_for_create);
 	if (ret < 0)
 		return false;
@@ -573,6 +627,10 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 	}
 	_debug("file -> %pd positive", dentry);
 
+	ret = cachefiles_recheck_size(object, file);
+	if (ret < 0)
+		goto check_failed;
+
 	ret = cachefiles_check_auxdata(object, file);
 	if (ret < 0)
 		goto check_failed;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

