Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A3D5875C2
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0K5gU6EifpHRPGjVbMLkq+HVOM4hTnWEtx46+H3oTm0=;
	b=TVnKDzf4TbiYtiZXDmYSTVNWO6j8t41ny5BgB4lZQYOK7iMLXYNh/AQklWbNheYCetI+vV
	Vz7HNdw80xOGY7YgsjkOu0Q7BusKS1qJ8vUo5EKYCAZinIxM8BuHpqGgA1lH/ccmConEHW
	HASUmSZGiTlNsXd40THMPeXNwTJW0xQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-OGFd7UTrM12LcVTpzRqvRw-1; Mon, 01 Aug 2022 23:04:02 -0400
X-MC-Unique: OGFd7UTrM12LcVTpzRqvRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F0103C01DF5;
	Tue,  2 Aug 2022 03:04:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16014492C3B;
	Tue,  2 Aug 2022 03:04:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E990A1946A52;
	Tue,  2 Aug 2022 03:04:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 905641946A4A for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7EE604010FA2; Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2F54010E37
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63FDE294EDC9
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-mJWNoQbzMHK1KP2T5o-72g-1; Mon, 01 Aug 2022 23:03:50 -0400
X-MC-Unique: mJWNoQbzMHK1KP2T5o-72g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9W-Nf_1659409426
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9W-Nf_1659409426) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:47 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:38 +0800
Message-Id: <20220802030342.46302-6-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH RFC 5/9] cachefiles: mark content map on
 write to the backing file
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark the content map on completion of the write to the backing file.

The expansion of the content map (when the backing file is truncated to
a larger size), and the allocation of the content map (when the backing
file is a newly created tmpfile) is delayed to the point when the
content map needs to be marked. It shall be safe to allocate memory with
GFP_KERNEL inside the iocb.ki_complete() callback, since the callback is
scheduled by workqueue for DIRECT IO.

The content map is sized in granule of block size of backing filesystem,
so that the backing content map file can be easily punched hole if the
content map gets truncated or invalidated. Currently the content map is
sized in PAGE_SIZE unit, which shall be multiples times of the block
size of backing filesystem. Each bit of the content map indicates the
existence of 4KB data of the backing file, thus each (4K sized) chunk of
content map covers 128MB data of the backing file.

When expanding the content map, a new content map needs to be allocated.
A new offset inside the backing content map file also needs to be
allocated, with the old range starting from the old offset getting
punched hole. Currently the new offset is always allocated in an append
style, i.e. the previous hole will not be reused.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/content-map.c | 129 ++++++++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h    |   2 +
 fs/cachefiles/io.c          |   3 +
 3 files changed, 134 insertions(+)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 3432efdecbcf..877ff79e181b 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -1,8 +1,24 @@
 #include <linux/fs.h>
 #include <linux/namei.h>
 #include <linux/uio.h>
+#include <linux/falloc.h>
 #include "internal.h"
 
+/*
+ * Return the size of the content map in bytes.
+ *
+ * There's one bit per granule (CACHEFILES_GRAN_SIZE, i.e. 4K). We size it in
+ * terms of block size chunks (e.g. 4K), so that the map file can be punched
+ * hole when the content map is truncated or invalidated. In this case, each 4K
+ * chunk spans (4096 * BITS_PER_BYTE * CACHEFILES_GRAN_SIZE, i.e. 128M) of file
+ * space.
+ */
+static size_t cachefiles_map_size(loff_t i_size)
+{
+	i_size = round_up(i_size, PAGE_SIZE * BITS_PER_BYTE * CACHEFILES_GRAN_SIZE);
+	return i_size / BITS_PER_BYTE / CACHEFILES_GRAN_SIZE;
+}
+
 /*
  * Zero the unused tail.
  *
@@ -91,3 +107,116 @@ void cachefiles_save_content_map(struct cachefiles_object *object)
 	if (ret != object->content_map_size)
 		object->content_info = CACHEFILES_CONTENT_NO_DATA;
 }
+
+static loff_t cachefiles_expand_map_off(struct file *file, loff_t old_off,
+					size_t old_size, size_t new_size)
+{
+	struct inode *inode = file_inode(file);
+	loff_t new_off;
+	bool punch = false;
+
+	inode_lock(inode);
+	new_off = i_size_read(inode);
+	/*
+	 * Simply expand the old content map range if possible; or discard the
+	 * old content map range and create a new one.
+	 */
+	if (new_off == old_off + old_size) {
+		i_size_write(inode, old_off + new_size);
+		new_off = old_off;
+	} else {
+		i_size_write(inode, new_off + new_size);
+		punch = true;
+	}
+	inode_unlock(inode);
+
+	if (punch)
+		vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			      old_off, old_size);
+
+	return new_off;
+}
+
+/*
+ * Expand the content map to a larger file size.
+ */
+static void cachefiles_expand_content_map(struct cachefiles_object *object)
+{
+	struct file *file = object->volume->content_map[(u8)object->cookie->key_hash];
+	size_t size, zap_size;
+	void *map, *zap;
+	loff_t off;
+
+	size = cachefiles_map_size(object->cookie->object_size);
+	if (size <= object->content_map_size)
+		return;
+
+	map = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, get_order(size));
+	if (!map)
+		return;
+
+	write_lock_bh(&object->content_map_lock);
+	if (size > object->content_map_size) {
+		zap = object->content_map;
+		zap_size = object->content_map_size;
+		memcpy(map, zap, zap_size);
+		object->content_map = map;
+		object->content_map_size = size;
+
+		/* expand the content map file */
+		off = object->content_map_off;
+		if (off != CACHEFILES_CONTENT_MAP_OFF_INVAL)
+			object->content_map_off = cachefiles_expand_map_off(file,
+				off, zap_size, size);
+	} else {
+		zap = map;
+		zap_size = size;
+	}
+	write_unlock_bh(&object->content_map_lock);
+
+	free_pages((unsigned long)zap, get_order(zap_size));
+}
+
+void cachefiles_mark_content_map(struct cachefiles_object *object,
+				 loff_t start, loff_t len)
+{
+	pgoff_t granule;
+	loff_t end = start + len;
+
+	if (object->cookie->advice & FSCACHE_ADV_SINGLE_CHUNK) {
+		if (start == 0) {
+			object->content_info = CACHEFILES_CONTENT_SINGLE;
+			set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags);
+		}
+		return;
+	}
+
+	if (object->content_info == CACHEFILES_CONTENT_NO_DATA)
+		object->content_info = CACHEFILES_CONTENT_MAP;
+
+	/* TODO: set CACHEFILES_CONTENT_BACKFS_MAP accordingly */
+
+	if (object->content_info != CACHEFILES_CONTENT_MAP)
+		return;
+
+	read_lock_bh(&object->content_map_lock);
+	start = round_down(start, CACHEFILES_GRAN_SIZE);
+	do {
+		granule = start / CACHEFILES_GRAN_SIZE;
+		if (granule / BITS_PER_BYTE >= object->content_map_size) {
+			read_unlock_bh(&object->content_map_lock);
+			cachefiles_expand_content_map(object);
+			read_lock_bh(&object->content_map_lock);
+		}
+
+		if (WARN_ON(granule / BITS_PER_BYTE >= object->content_map_size))
+			break;
+
+		set_bit(granule, object->content_map);
+		start += CACHEFILES_GRAN_SIZE;
+	} while (start < end);
+
+	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags);
+	read_unlock_bh(&object->content_map_lock);
+}
+
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 1335ea5f4a5e..c252746c8f9b 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -181,6 +181,8 @@ extern int cachefiles_has_space(struct cachefiles_cache *cache,
  */
 extern int cachefiles_load_content_map(struct cachefiles_object *object);
 extern void cachefiles_save_content_map(struct cachefiles_object *object);
+extern void cachefiles_mark_content_map(struct cachefiles_object *object,
+					loff_t start, loff_t len);
 
 /*
  * daemon.c
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index b513d9bf81f1..27171fac649e 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -264,6 +264,9 @@ static void cachefiles_write_complete(struct kiocb *iocb, long ret)
 	__sb_writers_acquired(inode->i_sb, SB_FREEZE_WRITE);
 	__sb_end_write(inode->i_sb, SB_FREEZE_WRITE);
 
+	if (ret == ki->len)
+		cachefiles_mark_content_map(ki->object, ki->start, ki->len);
+
 	if (ret < 0)
 		trace_cachefiles_io_error(object, inode, ret,
 					  cachefiles_trace_write_error);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

