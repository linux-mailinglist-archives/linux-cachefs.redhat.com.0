Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEDB5875C1
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3WEWoyUEqJwPkDe/NCwhHotd1H3xlug2Fo75d5wChA4=;
	b=dRVBSLDK3StOrmfeAFXFXXqbetODt1ay0aCl3gxqvQj0B4ue9VcXnl+1XJ/b4cGrTpvGAV
	QtxJV5SGM7+CqJ4UlBX9tsgGVzzNdnEed/NWucgGp82hlmpV5sxdXgL/niPbKfMLrGD2IT
	K5S2bZG5RQ2J2mlDU47Sxd41NKDyxow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-tqVC1S63OFmurNAmxel8ug-1; Mon, 01 Aug 2022 23:03:59 -0400
X-MC-Unique: tqVC1S63OFmurNAmxel8ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30003802D1C;
	Tue,  2 Aug 2022 03:03:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26A5C141510F;
	Tue,  2 Aug 2022 03:03:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF3C21946A4D;
	Tue,  2 Aug 2022 03:03:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EFF541946A4C for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE9CE492CA2; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB0D8492C3B
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F78801231
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-He-O4Q7PONWnrG20o8gR_g-1; Mon, 01 Aug 2022 23:03:51 -0400
X-MC-Unique: He-O4Q7PONWnrG20o8gR_g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9XT1b_1659409427
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9XT1b_1659409427) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:48 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:39 +0800
Message-Id: <20220802030342.46302-7-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH RFC 6/9] cachefiles: check content map on
 read/write
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cachefiles_find_next_granule()/cachefiles_find_next_hole() are used to
check if the requested range has been cached or not. The return value of
these two functions imitates that of SEEK_[DATA|HOLE], so that the
existing codes can be resued as much as possible.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/content-map.c | 30 ++++++++++++++++++++++++++++++
 fs/cachefiles/internal.h    |  4 ++++
 fs/cachefiles/io.c          | 36 +++++++++++++++++++++++++++++++-----
 3 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 877ff79e181b..949ec5d9e4c9 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -220,3 +220,33 @@ void cachefiles_mark_content_map(struct cachefiles_object *object,
 	read_unlock_bh(&object->content_map_lock);
 }
 
+loff_t cachefiles_find_next_granule(struct cachefiles_object *object,
+				    loff_t start)
+{
+	unsigned long size, granule = start / CACHEFILES_GRAN_SIZE;
+	loff_t result;
+
+	read_lock_bh(&object->content_map_lock);
+	size = object->content_map_size * BITS_PER_BYTE;
+	result = find_next_bit(object->content_map, size, granule);
+	read_unlock_bh(&object->content_map_lock);
+
+	if (result == size)
+		return -ENXIO;
+	return result * CACHEFILES_GRAN_SIZE;
+}
+
+loff_t cachefiles_find_next_hole(struct cachefiles_object *object,
+				 loff_t start)
+{
+	unsigned long size, granule = start / CACHEFILES_GRAN_SIZE;
+	loff_t result;
+
+	read_lock_bh(&object->content_map_lock);
+	size = object->content_map_size * BITS_PER_BYTE;
+	result = find_next_zero_bit(object->content_map, size, granule);
+	read_unlock_bh(&object->content_map_lock);
+
+	return min_t(loff_t, result * CACHEFILES_GRAN_SIZE,
+			     object->cookie->object_size);
+}
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c252746c8f9b..506700809a6d 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -183,6 +183,10 @@ extern int cachefiles_load_content_map(struct cachefiles_object *object);
 extern void cachefiles_save_content_map(struct cachefiles_object *object);
 extern void cachefiles_mark_content_map(struct cachefiles_object *object,
 					loff_t start, loff_t len);
+extern loff_t cachefiles_find_next_granule(struct cachefiles_object *object,
+					   loff_t start);
+extern loff_t cachefiles_find_next_hole(struct cachefiles_object *object,
+					loff_t start);
 
 /*
  * daemon.c
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 27171fac649e..5c7c84cdafea 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -30,6 +30,32 @@ struct cachefiles_kiocb {
 	u64			b_writing;
 };
 
+static loff_t cachefiles_seek_data(struct cachefiles_object *object,
+		struct file *file, loff_t start)
+{
+	switch (object->content_info) {
+	case CACHEFILES_CONTENT_MAP:
+		return cachefiles_find_next_granule(object, start);
+	case CACHEFILES_CONTENT_BACKFS_MAP:
+		return vfs_llseek(file, start, SEEK_DATA);
+	default:
+		return -EINVAL;
+	}
+}
+
+static loff_t cachefiles_seek_hole(struct cachefiles_object *object,
+		struct file *file, loff_t start)
+{
+	switch (object->content_info) {
+	case CACHEFILES_CONTENT_MAP:
+		return cachefiles_find_next_hole(object, start);
+	case CACHEFILES_CONTENT_BACKFS_MAP:
+		return vfs_llseek(file, start, SEEK_HOLE);
+	default:
+		return -EINVAL;
+	}
+}
+
 static inline void cachefiles_put_kiocb(struct cachefiles_kiocb *ki)
 {
 	if (refcount_dec_and_test(&ki->ki_refcnt)) {
@@ -103,7 +129,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 
 		off2 = cachefiles_inject_read_error();
 		if (off2 == 0)
-			off2 = vfs_llseek(file, off, SEEK_DATA);
+			off2 = cachefiles_seek_data(object, file, off);
 		if (off2 < 0 && off2 >= (loff_t)-MAX_ERRNO && off2 != -ENXIO) {
 			skipped = 0;
 			ret = off2;
@@ -442,7 +468,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 retry:
 	off = cachefiles_inject_read_error();
 	if (off == 0)
-		off = vfs_llseek(file, subreq->start, SEEK_DATA);
+		off = cachefiles_seek_data(object, file, subreq->start);
 	if (off < 0 && off >= (loff_t)-MAX_ERRNO) {
 		if (off == (loff_t)-ENXIO) {
 			why = cachefiles_trace_read_seek_nxio;
@@ -468,7 +494,7 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 
 	to = cachefiles_inject_read_error();
 	if (to == 0)
-		to = vfs_llseek(file, subreq->start, SEEK_HOLE);
+		to = cachefiles_seek_hole(object, file, subreq->start);
 	if (to < 0 && to >= (loff_t)-MAX_ERRNO) {
 		trace_cachefiles_io_error(object, file_inode(file), to,
 					  cachefiles_trace_seek_error);
@@ -537,7 +563,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
-		pos = vfs_llseek(file, *_start, SEEK_DATA);
+		pos = cachefiles_seek_data(object, file, *_start);
 	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
 		if (pos == -ENXIO)
 			goto check_space; /* Unallocated tail */
@@ -558,7 +584,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
-		pos = vfs_llseek(file, *_start, SEEK_HOLE);
+		pos = cachefiles_seek_hole(object, file, *_start);
 	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
 		trace_cachefiles_io_error(object, file_inode(file), pos,
 					  cachefiles_trace_seek_error);
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

