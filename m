Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA54346D04
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 23:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616538607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kST3USltKeV4B7dJVqSsWAjvdxupcxgKHv7Wu4bUbuY=;
	b=X6HHquXcB5w6VgtmztTnV8Q7psPnODpOWCpf44eVcBSR03bQ44Lref+5znUK/tM1jDL2LC
	bffyUawPqUzPl7OlJ3ugKaJLld+mkd3qT+UKdFLPJdvwADNpzSh0VZiEUBGIgLp89R29z3
	LLzwCbrTB3S855asXFKO4ruxosxkF6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-MTo9Fw_ZO76W_kfhFPc2WA-1; Tue, 23 Mar 2021 18:30:05 -0400
X-MC-Unique: MTo9Fw_ZO76W_kfhFPc2WA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DBD9839A45;
	Tue, 23 Mar 2021 22:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56BE71002D71;
	Tue, 23 Mar 2021 22:30:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C4C44BB7C;
	Tue, 23 Mar 2021 22:30:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NML1pv025331 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 18:21:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99F4510074FC; Tue, 23 Mar 2021 22:21:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2433610023B5;
	Tue, 23 Mar 2021 22:20:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 23 Mar 2021 22:20:55 +0000
Message-ID: <161653805530.2770958.15120507632529970934.stgit@warthog.procyon.org.uk>
In-Reply-To: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
References: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Mar 2021 18:29:55 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v5 17/28] afs: Print the operation debug_id
 when logging an unexpected data version
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Print the afs_operation debug_id when logging an unexpected change in the
data version.  This allows the logged message to be matched against
tracelines.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/160588528377.3465195.2206051235095182302.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118146111.1232039.11398082422487058312.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161042180.2537118.2471333561661033316.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340405772.1303470.3877167548944248214.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539549628.286939.15234870409714613954.stgit@warthog.procyon.org.uk/ # v4
---

 fs/afs/inode.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 48519ee00eef..af6556bb3d6a 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -215,11 +215,12 @@ static void afs_apply_status(struct afs_operation *op,
 
 	if (vp->dv_before + vp->dv_delta != status->data_version) {
 		if (test_bit(AFS_VNODE_CB_PROMISED, &vnode->flags))
-			pr_warn("kAFS: vnode modified {%llx:%llu} %llx->%llx %s\n",
+			pr_warn("kAFS: vnode modified {%llx:%llu} %llx->%llx %s (op=%x)\n",
 				vnode->fid.vid, vnode->fid.vnode,
 				(unsigned long long)vp->dv_before + vp->dv_delta,
 				(unsigned long long)status->data_version,
-				op->type ? op->type->name : "???");
+				op->type ? op->type->name : "???",
+				op->debug_id);
 
 		vnode->invalid_before = status->data_version;
 		if (vnode->status.type == AFS_FTYPE_DIR) {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

