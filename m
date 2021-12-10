Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A512E46FBC5
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499--Bf2kvYdNyeoatEq1Ttm3w-1; Fri, 10 Dec 2021 02:37:06 -0500
X-MC-Unique: -Bf2kvYdNyeoatEq1Ttm3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D5C1100C662;
	Fri, 10 Dec 2021 07:37:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50B24604CC;
	Fri, 10 Dec 2021 07:37:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 259001809CB8;
	Fri, 10 Dec 2021 07:37:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aZQm027814 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C52132026612; Fri, 10 Dec 2021 07:36:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D1F2026990
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6678D1078463
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:32 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-424-sbx898bINnuiz1PHmpPhZw-1; Fri, 10 Dec 2021 02:36:30 -0500
X-MC-Unique: sbx898bINnuiz1PHmpPhZw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1;
	HT=alimailimapcm10staff010182156082;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-83nss_1639121784
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-83nss_1639121784) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:25 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:04 +0800
Message-Id: <20211210073619.21667-5-jefflexu@linux.alibaba.com>
In-Reply-To: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
References: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 04/19] netfs: make ops->init_rreq() optional
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/ceph/addr.c         | 5 -----
 fs/netfs/read_helper.c | 3 ++-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index e53c8541f5b2..c3537dfd8c04 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -291,10 +291,6 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
 	dout("%s: result %d\n", __func__, err);
 }
 
-static void ceph_init_rreq(struct netfs_read_request *rreq, struct file *file)
-{
-}
-
 static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 {
 	struct inode *inode = mapping->host;
@@ -306,7 +302,6 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 }
 
 static const struct netfs_read_request_ops ceph_netfs_read_ops = {
-	.init_rreq		= ceph_init_rreq,
 	.is_cache_enabled	= ceph_is_cache_enabled,
 	.begin_cache_operation	= ceph_begin_cache_operation,
 	.issue_op		= ceph_netfs_issue_op,
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 0807d2bb450d..4247916c7100 100644
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
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

