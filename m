Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC885875C3
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lbMk9zcX6khCCoPCWB3Q8UXxSVDADOe3E7v6JxLpnWk=;
	b=LY6kPq+f7/DDffOPb0QsXzd95uWpNyVGQVJpOr4OwaWkAEZfp37WG4/SBzE2p2dIWG9gRW
	Mp7bc54ugSZJ1rPS1GDZkj2b679ns9BaYg3sNaHmtJM9zgECXnA6EscT45mmiwYKH+B+nc
	xExHDDqGduoOams3BT8Ow86/ZaPntwA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-GE7McK0jOmi-001nx6LTJw-1; Mon, 01 Aug 2022 23:04:04 -0400
X-MC-Unique: GE7McK0jOmi-001nx6LTJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9713F3C01DF4;
	Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D05DC27DB3;
	Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5731A1946A4D;
	Tue,  2 Aug 2022 03:04:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8C7331946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 706994010E37; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C46840C1288
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5421C3C01DF5
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-wdfAMfJMNky2jp4Hz83J7g-1; Mon, 01 Aug 2022 23:03:53 -0400
X-MC-Unique: wdfAMfJMNky2jp4Hz83J7g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9W-Pi_1659409429
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9W-Pi_1659409429) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:49 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:41 +0800
Message-Id: <20220802030342.46302-9-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [PATCH RFC 8/9] cachefiles: resize content map on
 resize
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adjust the content map when we shorten a backing object. In this case,
only the unused tail of the content map after shortening gets zeroed,
while the size of the content map itself is not changed. Also the
corresponding range in the backing content map file is not changed.

Besides, the content map and the corresponding range in the backing
content map file are not touched when we expand a backing object. They
will be lazily expanded at runtime later.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/content-map.c | 23 +++++++++++++++++++++++
 fs/cachefiles/interface.c   |  1 +
 fs/cachefiles/internal.h    |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index b73a109844ca..360c59b06670 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -271,3 +271,26 @@ void cachefiles_invalidate_content_map(struct cachefiles_object *object)
 	}
 	write_unlock_bh(&object->content_map_lock);
 }
+
+/*
+ * Adjust the content map when we shorten a backing object.
+ */
+void cachefiles_shorten_content_map(struct cachefiles_object *object,
+				    loff_t new_size)
+{
+	if (object->content_info != CACHEFILES_CONTENT_MAP)
+		return;
+
+	read_lock_bh(&object->content_map_lock);
+	/*
+	 * Nothing needs to be done when content map has not been allocated yet.
+	 */
+	if (!object->content_map_size)
+		goto out;
+
+	if (cachefiles_map_size(new_size) <= object->content_map_size)
+		cachefiles_zero_content_map(object->content_map,
+				object->content_map_size, new_size);
+out:
+	read_unlock_bh(&object->content_map_lock);
+}
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index f87b9a665d85..76f70a9ebe50 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -290,6 +290,7 @@ static void cachefiles_resize_cookie(struct netfs_cache_resources *cres,
 		cachefiles_begin_secure(cache, &saved_cred);
 		cachefiles_shorten_object(object, file, new_size);
 		cachefiles_end_secure(cache, saved_cred);
+		cachefiles_shorten_content_map(object, new_size);
 		object->cookie->object_size = new_size;
 		return;
 	}
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c674c4e42529..7747f99f00c1 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -188,6 +188,8 @@ extern loff_t cachefiles_find_next_granule(struct cachefiles_object *object,
 extern loff_t cachefiles_find_next_hole(struct cachefiles_object *object,
 					loff_t start);
 extern void cachefiles_invalidate_content_map(struct cachefiles_object *object);
+extern void cachefiles_shorten_content_map(struct cachefiles_object *object,
+					   loff_t new_size);
 
 /*
  * daemon.c
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

