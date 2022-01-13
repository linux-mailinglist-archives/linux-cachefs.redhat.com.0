Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0448D380
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 09:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642062188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KUsDjntG9rbeqbsmmT3uuQvkU46lqqwqkbY93lrzsdY=;
	b=LNNMQvZwsZ3zyISA2eFkMJA8INfx9C+dex31al1nKV14jpHhVOak2zR96JIPmzmW7+PLkK
	PYfWkeKJs4+piMmRYHAboSAHKs84AIK4zcdBku/IEa4dWp1CeTqCzYPMJTSoPdX265hoXa
	lZAKZi9sE1XR+RO1LFdJTlDlaxJLmSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-GFWsWeZdMo-fSKQeJl8tOA-1; Thu, 13 Jan 2022 03:23:05 -0500
X-MC-Unique: GFWsWeZdMo-fSKQeJl8tOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB5618B9F03;
	Thu, 13 Jan 2022 08:23:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF9A4EC97;
	Thu, 13 Jan 2022 08:23:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8255F4BB7C;
	Thu, 13 Jan 2022 08:23:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20D8N1E1021603 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 03:23:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4237078B15; Thu, 13 Jan 2022 08:23:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1894A78AFE;
	Thu, 13 Jan 2022 08:22:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20211228124419.103020-1-jefflexu@linux.alibaba.com>
References: <20211228124419.103020-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 13 Jan 2022 08:22:59 +0000
Message-ID: <1483070.1642062179@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20D8N1E1021603
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] netfs: Make ops->init_rreq() optional
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
Content-ID: <1483069.1642062179.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jeffle,

I've altered your patch commit message, if you could take a look?

David
---
From: Jeffle Xu <jefflexu@linux.alibaba.com>

netfs: Make ops->init_rreq() optional

Make the ops->init_rreq() callback optional.  This isn't required for the
erofs changes I'm implementing to do on-demand read through fscache[1].
Further, ceph has an empty init_rreq method that can then be removed and
it's marked optional in the documentation.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Link: https://lore.kernel.org/r/20211227125444.21187-1-jefflexu@linux.alibaba.com/ [1]
Link: https://lore.kernel.org/r/20211228124419.103020-1-jefflexu@linux.alibaba.com
---
 fs/ceph/addr.c         |    5 -----
 fs/netfs/read_helper.c |    3 ++-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index b3d9459c9bbd..c98e5238a1b6 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -297,10 +297,6 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
 	dout("%s: result %d\n", __func__, err);
 }
 
-static void ceph_init_rreq(struct netfs_read_request *rreq, struct file *file)
-{
-}
-
 static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 {
 	struct inode *inode = mapping->host;
@@ -312,7 +308,6 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 }
 
 static const struct netfs_read_request_ops ceph_netfs_read_ops = {
-	.init_rreq		= ceph_init_rreq,
 	.is_cache_enabled	= ceph_is_cache_enabled,
 	.begin_cache_operation	= ceph_begin_cache_operation,
 	.issue_op		= ceph_netfs_issue_op,
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 6169659857b3..501da990c259 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -55,7 +55,8 @@ static struct netfs_read_request *netfs_alloc_read_request(
 		INIT_WORK(&rreq->work, netfs_rreq_work);
 		refcount_set(&rreq->usage, 1);
 		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
-		ops->init_rreq(rreq, file);
+		if (ops->init_rreq)
+			ops->init_rreq(rreq, file);
 		netfs_stat(&netfs_n_rh_rreq);
 	}
 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

