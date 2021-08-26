Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 452B93F88BD
	for <lists+linux-cachefs@lfdr.de>; Thu, 26 Aug 2021 15:25:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-LPFUuiZWMy-c_q5Ee-aqPA-1; Thu, 26 Aug 2021 09:24:56 -0400
X-MC-Unique: LPFUuiZWMy-c_q5Ee-aqPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18912100F764;
	Thu, 26 Aug 2021 13:24:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEBD560C04;
	Thu, 26 Aug 2021 13:24:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3D384A7C9;
	Thu, 26 Aug 2021 13:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17QDOpVo023501 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 26 Aug 2021 09:24:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11626F894B; Thu, 26 Aug 2021 13:24:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D5CAF97C5
	for <linux-cachefs@redhat.com>; Thu, 26 Aug 2021 13:24:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAB23866DF5
	for <linux-cachefs@redhat.com>; Thu, 26 Aug 2021 13:24:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-422-rM28g1EnPyecwmmNU7dTAg-1;
	Thu, 26 Aug 2021 09:24:46 -0400
X-MC-Unique: rM28g1EnPyecwmmNU7dTAg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38D82610A7;
	Thu, 26 Aug 2021 13:24:45 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 26 Aug 2021 09:24:43 -0400
Message-Id: <20210826132443.64047-3-jlayton@kernel.org>
In-Reply-To: <20210826132443.64047-1-jlayton@kernel.org>
References: <20210826132443.64047-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 2/2] netfs: add a new flag indicating that
	readahead should not be done
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With ceph, if we don't have appropriate caps, then it's best to give up
on doing any readahead. Add a mechanism to allow its init_rreq op to
indicate that.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/netfs/read_helper.c | 5 +++++
 include/linux/netfs.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index d7129d2229e2..3f1a503d81b4 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -925,6 +925,8 @@ void netfs_readahead(struct readahead_control *ractl)
 					readahead_length(ractl), true);
 	if (!rreq)
 		return;
+	if (test_bit(NETFS_RREQ_DENY_READAHEAD, &rreq->flags))
+		goto cleanup_free;
 
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
@@ -989,6 +991,7 @@ int netfs_readpage(struct file *file, struct page *subpage)
 					folio_size(folio), false);
 	if (!rreq)
 		goto nomem;
+	WARN_ON_ONCE(test_bit(NETFS_RREQ_DENY_READAHEAD, &rreq->flags));
 
 	ret = netfs_begin_cache_operation(rreq, ctx);
 	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
@@ -1179,6 +1182,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 					folio_size(folio), false);
 	if (!rreq)
 		goto error;
+	WARN_ON_ONCE(test_bit(NETFS_RREQ_DENY_READAHEAD, &rreq->flags));
 	rreq->start		= folio_file_pos(folio);
 	rreq->len		= folio_size(folio);
 	rreq->no_unlock_folio	= folio_index(folio);
@@ -1288,6 +1292,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	if (!rreq)
 		goto error;
 
+	WARN_ON_ONCE(test_bit(NETFS_RREQ_DENY_READAHEAD, &rreq->flags));
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 	ret = netfs_begin_cache_operation(rreq, ctx);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 8361db18d572..3bf1854e511d 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -209,6 +209,7 @@ struct netfs_read_request {
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_DECRYPT		6	/* Decrypted when the request completes */
 #define NETFS_RREQ_READAHEAD		7	/* This is a readahead op */
+#define NETFS_RREQ_DENY_READAHEAD	8	/* Abort the readahead */
 	const struct netfs_request_ops *netfs_ops;
 };
 
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

