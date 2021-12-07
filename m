Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A846B16A
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 04:20:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-409-XV6gqgRRMWGfkv_zn5xMxQ-1; Mon, 06 Dec 2021 22:20:27 -0500
X-MC-Unique: XV6gqgRRMWGfkv_zn5xMxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2DD181CCB4;
	Tue,  7 Dec 2021 03:20:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 573425BE05;
	Tue,  7 Dec 2021 03:20:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE6EB4BB7C;
	Tue,  7 Dec 2021 03:20:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B73KDp8027581 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 22:20:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4320B2166B26; Tue,  7 Dec 2021 03:20:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E0E32166B25
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 03:20:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65B5A85A5A8
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 03:20:10 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-559-kU9YQoUnOI-6VQHRzziNnQ-1; Mon, 06 Dec 2021 22:20:08 -0500
X-MC-Unique: kU9YQoUnOI-6VQHRzziNnQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
	TI=SMTPD_---0Uzilg7F_1638846889
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0Uzilg7F_1638846889) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 07 Dec 2021 11:14:49 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com
Date: Tue,  7 Dec 2021 11:14:49 +0800
Message-Id: <20211207031449.100510-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] netfs: fix parameter of cleanup()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The order of these two parameters is just reversed. gcc didn't warn on
that, probably because 'void *' can be converted from or to other
pointer types without warning.

Cc: stable@vger.kernel.org
Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
Fixes: e1b1240c1ff5 ("netfs: Add write_begin helper")
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/netfs/read_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 7046f9bdd8dc..4adcb0336ecf 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -960,7 +960,7 @@ int netfs_readpage(struct file *file,
 	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
 	if (!rreq) {
 		if (netfs_priv)
-			ops->cleanup(netfs_priv, folio_file_mapping(folio));
+			ops->cleanup(folio_file_mapping(folio), netfs_priv);
 		folio_unlock(folio);
 		return -ENOMEM;
 	}
@@ -1191,7 +1191,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 		goto error;
 have_folio_no_wait:
 	if (netfs_priv)
-		ops->cleanup(netfs_priv, mapping);
+		ops->cleanup(mapping, netfs_priv);
 	*_folio = folio;
 	_leave(" = 0");
 	return 0;
@@ -1202,7 +1202,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	folio_unlock(folio);
 	folio_put(folio);
 	if (netfs_priv)
-		ops->cleanup(netfs_priv, mapping);
+		ops->cleanup(mapping, netfs_priv);
 	_leave(" = %d", ret);
 	return ret;
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

