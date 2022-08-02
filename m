Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57F5875C0
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wT11qavmhJtqiG6EpDkUdleLdaWDZVWJ8nuikXyv5Uw=;
	b=A3xVAqDkThWlFr+vplDgEoW3m7xwGCTThXm+3jEADsBoawbHhXiSPxAOq8VRRTVnWciasU
	gXSwe7nPVVr9HQguzHnB0ao2lgJdUQ+l44e1Pgst7LsiFNULyt0J6wuns4ppw58x3zikWb
	OkxYeEYK0rsE+8RGLELcbLFljKzLBns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-JgBnsn9gPDKIC7zubv4O0A-1; Mon, 01 Aug 2022 23:03:59 -0400
X-MC-Unique: JgBnsn9gPDKIC7zubv4O0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF5DF1C0515D;
	Tue,  2 Aug 2022 03:03:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5C012026D64;
	Tue,  2 Aug 2022 03:03:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BBCD51946A44;
	Tue,  2 Aug 2022 03:03:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61E471946A44 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 376B84010FA2; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33CC44010E37
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D668180F6DF
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-fF-WaywNMnygsFUR9eBJAQ-1; Mon, 01 Aug 2022 23:03:54 -0400
X-MC-Unique: fF-WaywNMnygsFUR9eBJAQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9PAYh_1659409430
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9PAYh_1659409430) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:50 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:42 +0800
Message-Id: <20220802030342.46302-10-jefflexu@linux.alibaba.com>
In-Reply-To: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
References: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH RFC 9/9] cachefiles: cull content map file
 on cull
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
Cc: xiang@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Also hole punch the backing content map file when the backing object
gets culled.

When cacehfilesd is going to cull a whole directory, the whole
directory will be moved to the graveyard and then cacehfilesd itself
will remove all files under the directory one by one. Since each
sub-directory under one volume maintains one backing content map file,
cacehfilesd already works well with this bitmap-based mechanism and
doesn't need any refactoring.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/content-map.c | 37 +++++++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h    |  4 ++++
 fs/cachefiles/namei.c       |  4 ++++
 fs/cachefiles/xattr.c       | 17 +++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 360c59b06670..5584a0182df9 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -294,3 +294,40 @@ void cachefiles_shorten_content_map(struct cachefiles_object *object,
 out:
 	read_unlock_bh(&object->content_map_lock);
 }
+
+int cachefiles_cull_content_map(struct cachefiles_cache *cache,
+				struct dentry *dir, struct dentry *victim)
+{
+	struct dentry *map;
+	struct file *map_file;
+	size_t content_map_size = 0;
+	loff_t content_map_off = 0;
+	struct path path;
+	int ret;
+
+	if (!d_is_reg(victim))
+		return 0;
+
+	ret = cachefiles_get_content_info(victim, &content_map_size, &content_map_off);
+	if (ret || !content_map_size)
+		return ret;
+
+	map = lookup_positive_unlocked("Map", dir, strlen("Map"));
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	path.mnt = cache->mnt;
+	path.dentry = map;
+	map_file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE,
+			d_backing_inode(map), cache->cache_cred);
+	if (IS_ERR(map_file)) {
+		dput(map);
+		return PTR_ERR(map_file);
+	}
+
+	ret = vfs_fallocate(map_file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			      content_map_off, content_map_size);
+
+	fput(map_file);
+	return ret;
+}
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 7747f99f00c1..9c36631ee051 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -190,6 +190,8 @@ extern loff_t cachefiles_find_next_hole(struct cachefiles_object *object,
 extern void cachefiles_invalidate_content_map(struct cachefiles_object *object);
 extern void cachefiles_shorten_content_map(struct cachefiles_object *object,
 					   loff_t new_size);
+extern int cachefiles_cull_content_map(struct cachefiles_cache *cache,
+				struct dentry *dir, struct dentry *victim);
 
 /*
  * daemon.c
@@ -384,6 +386,8 @@ extern int cachefiles_remove_object_xattr(struct cachefiles_cache *cache,
 extern void cachefiles_prepare_to_write(struct fscache_cookie *cookie);
 extern bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume);
 extern int cachefiles_check_volume_xattr(struct cachefiles_volume *volume);
+extern int cachefiles_get_content_info(struct dentry *dentry,
+		size_t *content_map_size, loff_t *content_map_off);
 
 /*
  * Error handling
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index f5e1ec1d9445..79c759468ab3 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -923,6 +923,10 @@ int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 	if (ret < 0)
 		goto error_unlock;
 
+	ret = cachefiles_cull_content_map(cache, dir, victim);
+	if (ret < 0)
+		goto error;
+
 	ret = cachefiles_bury_object(cache, NULL, dir, victim,
 				     FSCACHE_OBJECT_WAS_CULLED);
 	if (ret < 0)
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 05ac6b70787a..b7091c8e4262 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -283,3 +283,20 @@ int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
 	_leave(" = %d", ret);
 	return ret;
 }
+
+int cachefiles_get_content_info(struct dentry *dentry, size_t *content_map_size,
+				loff_t *content_map_off)
+{
+	struct cachefiles_xattr buf;
+	ssize_t xlen, tlen = sizeof(buf);
+
+	xlen = vfs_getxattr(&init_user_ns, dentry, cachefiles_xattr_cache, &buf, tlen);
+	if (xlen != tlen)
+		return -ESTALE;
+
+	if (buf.content == CACHEFILES_CONTENT_MAP) {
+		*content_map_off = be64_to_cpu(buf.content_map_off);
+		*content_map_size = be64_to_cpu(buf.content_map_size);
+	}
+	return 0;
+}
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

