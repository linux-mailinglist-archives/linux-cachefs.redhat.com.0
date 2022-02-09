Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4294AE9C7
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Feb 2022 07:01:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-RAjqzM7lMUqtcKiBOeht0A-1; Wed, 09 Feb 2022 01:01:48 -0500
X-MC-Unique: RAjqzM7lMUqtcKiBOeht0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2816751082;
	Wed,  9 Feb 2022 06:01:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A23623798;
	Wed,  9 Feb 2022 06:01:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D23274BB7C;
	Wed,  9 Feb 2022 06:01:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21961iFr002853 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 01:01:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2C34400F3EF; Wed,  9 Feb 2022 06:01:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE1104010A06
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C75F93804073
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:43 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-543-SzYWI_JTMMKcJ0-yUMS8Og-1; Wed, 09 Feb 2022 01:01:41 -0500
X-MC-Unique: SzYWI_JTMMKcJ0-yUMS8Og-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V3zwJoJ_1644386496
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V3zwJoJ_1644386496) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 09 Feb 2022 14:01:37 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  9 Feb 2022 14:01:07 +0800
Message-Id: <20220209060108.43051-22-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH v3 21/22] erofs: implement fscache-based
	data readahead for inline layout
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/fscache.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
index ef5eef33e3d5..003f9abdaf1b 100644
--- a/fs/erofs/fscache.c
+++ b/fs/erofs/fscache.c
@@ -198,6 +198,7 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
 enum erofs_fscache_readahead_type {
 	EROFS_FSCACHE_READAHEAD_TYPE_HOLE,
 	EROFS_FSCACHE_READAHEAD_TYPE_NOINLINE,
+	EROFS_FSCACHE_READAHEAD_TYPE_INLINE,
 };
 
 static int erofs_fscache_do_readahead(struct readahead_control *rac,
@@ -231,6 +232,9 @@ static int erofs_fscache_do_readahead(struct readahead_control *rac,
 			ret = erofs_fscache_readpage_noinline(page, fsmap);
 			fsmap->m_pa += EROFS_BLKSIZ;
 			break;
+		case EROFS_FSCACHE_READAHEAD_TYPE_INLINE:
+			ret = erofs_fscache_readpage_inline(page, fsmap);
+			break;
 		default:
 			DBG_BUGON(1);
 			return -EINVAL;
@@ -285,6 +289,10 @@ static void erofs_fscache_readahead(struct readahead_control *rac)
 				ret = erofs_fscache_do_readahead(rac, &fsmap,
 					EROFS_FSCACHE_READAHEAD_TYPE_NOINLINE);
 				break;
+			case EROFS_INODE_FLAT_INLINE:
+				ret = erofs_fscache_do_readahead(rac, &fsmap,
+					EROFS_FSCACHE_READAHEAD_TYPE_INLINE);
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

