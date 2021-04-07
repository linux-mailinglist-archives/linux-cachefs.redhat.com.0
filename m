Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE41A3570D1
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 17:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617810478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/hfOGeX+sSk/KFgSh0XISV8xrV1NyCPS4paAbSVrafI=;
	b=hOWT91rmSlhhmovgaTuLKcVomhLGC2zGKSSV0tJxGit2j+C9GdkTY1agbvqqfuGxN7PtnQ
	jPhTiy264FGLDG2Df6AmqPEtSwxJyj3KtsGT4SS4OvKZjNaXMZNtscECeTuhqD3DPLa/bJ
	vLMS4jANIfFf0wwvKMOSnoyRvdgd2fI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-51y0s2ayOyuE6meDRM8jIA-1; Wed, 07 Apr 2021 11:47:56 -0400
X-MC-Unique: 51y0s2ayOyuE6meDRM8jIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF4C8026AC;
	Wed,  7 Apr 2021 15:47:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCEB460254;
	Wed,  7 Apr 2021 15:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C11275533F;
	Wed,  7 Apr 2021 15:47:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137Flp69005289 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 11:47:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF83B5D9D0; Wed,  7 Apr 2021 15:47:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-201.rdu2.redhat.com
	[10.10.115.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 670E95D9DC;
	Wed,  7 Apr 2021 15:47:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: jlayton@kernel.org
Date: Wed, 07 Apr 2021 16:47:42 +0100
Message-ID: <161781046256.463527.18158681600085556192.stgit@warthog.procyon.org.uk>
In-Reply-To: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
References: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 3/5] netfs: Don't record the copy
	termination error
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

Don't record the copy termination error in the subrequest.  We shouldn't
return it through netfs_readpage() or netfs_write_begin() as we don't let
the netfs see cache errors.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/netfs/read_helper.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 8040b76da1b6..ad0dc01319ce 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -270,10 +270,8 @@ static void netfs_rreq_copy_terminated(void *priv, ssize_t transferred_or_error,
 	struct netfs_read_request *rreq = subreq->rreq;
 
 	if (IS_ERR_VALUE(transferred_or_error)) {
-		subreq->error = transferred_or_error;
 		netfs_stat(&netfs_n_rh_write_failed);
 	} else {
-		subreq->error = 0;
 		netfs_stat(&netfs_n_rh_write_done);
 	}
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

