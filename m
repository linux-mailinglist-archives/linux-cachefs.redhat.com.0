Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C944AE9C9
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Feb 2022 07:01:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-z4MiyTklNgu3qi_UaMFqXA-1; Wed, 09 Feb 2022 01:01:49 -0500
X-MC-Unique: z4MiyTklNgu3qi_UaMFqXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D943784B9A9;
	Wed,  9 Feb 2022 06:01:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E44F55F68;
	Wed,  9 Feb 2022 06:01:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6218B1806D1C;
	Wed,  9 Feb 2022 06:01:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21961jTF002864 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 01:01:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4808492D1B; Wed,  9 Feb 2022 06:01:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C099F492D18
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A75E7802D1F
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:45 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
	(out30-45.freemail.mail.aliyun.com [115.124.30.45]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-361-WK4524JmPSCj0NlaxiCOyQ-1; Wed, 09 Feb 2022 01:01:40 -0500
X-MC-Unique: WK4524JmPSCj0NlaxiCOyQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R631e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V3zaQVI_1644386495
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V3zaQVI_1644386495) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 09 Feb 2022 14:01:35 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  9 Feb 2022 14:01:06 +0800
Message-Id: <20220209060108.43051-21-jefflexu@linux.alibaba.com>
In-Reply-To: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH v3 20/22] erofs: implement fscache-based
	data readahead for non-inline layout
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

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index c8a0851230e5..ef5eef33e3d5 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -197,6 +197,7 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 
 enum erofs_fscache_readahead_type {
 	EROFS_FSCACHE_READAHEAD_TYPE_HOLE,
+	EROFS_FSCACHE_READAHEAD_TYPE_NOINLINE,
 };
 
 static int erofs_fscache_do_readahead(struct readahead_control *rac,
@@ -205,10 +206,14 @@ static int erofs_fscache_do_readahead(struct readahead_control *rac,
 {
 	size_t offset, length, done;
 	struct page *page;
+	int ret = 0;
 
 	/*
-	 * 1) For CHUNK_BASED (HOLE), the output map.m_la is rounded down to
-	 *    the nearest chunk boundary, and thus offset will be non-zero.
+	 * 1) For CHUNK_BASED (HOLE/NOINLINE), the output map.m_la is rounded
+	 *    down to the nearest chunk boundary, and thus offset will be
+	 *    non-zero.
+	 * 2) For the other cases, the output map.m_la shall be equal to o_la,
+	 *    and thus offset will be zero.
 	 */
 	offset = fsmap->o_la - fsmap->m_la;
 	length = fsmap->m_llen - offset;
@@ -222,11 +227,18 @@ static int erofs_fscache_do_readahead(struct readahead_control *rac,
 		case EROFS_FSCACHE_READAHEAD_TYPE_HOLE:
 			zero_user(page, 0, PAGE_SIZE);
 			break;
+		case EROFS_FSCACHE_READAHEAD_TYPE_NOINLINE:
+			ret = erofs_fscache_readpage_noinline(page, fsmap);
+			fsmap->m_pa += EROFS_BLKSIZ;
+			break;
 		default:
 			DBG_BUGON(1);
 			return -EINVAL;
 		}
 
+		if (ret)
+			return ret;
+
 		SetPageUptodate(page);
 		unlock_page(page);
 	}
@@ -263,7 +275,16 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 			ret = erofs_fscache_do_readahead(rac, &fsmap,
 					EROFS_FSCACHE_READAHEAD_TYPE_HOLE);
 		} else {
+			ret = erofs_fscache_get_map(&fsmap, &map, sb);
+			if (ret)
+				return;
+
 			switch (vi->datalayout) {
+			case EROFS_INODE_FLAT_PLAIN:
+			case EROFS_INODE_CHUNK_BASED:
+				ret = erofs_fscache_do_readahead(rac, &fsmap,
+					EROFS_FSCACHE_READAHEAD_TYPE_NOINLINE);
+				break;
 			default:
 				DBG_BUGON(1);
 				return;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

