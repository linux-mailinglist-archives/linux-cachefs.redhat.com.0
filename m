Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7469B369440
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Apr 2021 15:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619186171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m8V2LFvqaLBduE56XSzOX4e6JedH1si2pAKIZZ8kZAU=;
	b=OoUqQzIJ1qCNsBu6XrDlWPgSUaY9U7wfyc5kPqzOfes1O2pKzcOLRRMn6AvLyH8ogSkhaM
	Zm2OVJ6Xsiy32xm20LBrQTbV2OWDo1ZvXl4nXnqH/9AXP5ZDRsIvZOiY4wG6Sa7zx5JZ7w
	BA2WO2EyVLDqDBjZ/HS3p62KNU29iE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Wvag64K5N1OSgFwe6lqIjA-1; Fri, 23 Apr 2021 09:56:10 -0400
X-MC-Unique: Wvag64K5N1OSgFwe6lqIjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E4683DD25;
	Fri, 23 Apr 2021 13:56:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA7210016FE;
	Fri, 23 Apr 2021 13:56:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B7871806D1D;
	Fri, 23 Apr 2021 13:56:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NDYbIP023202 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 09:34:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20DA460C5F; Fri, 23 Apr 2021 13:34:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5AB460BE5;
	Fri, 23 Apr 2021 13:34:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 23 Apr 2021 14:34:30 +0100
Message-ID: <161918486998.3145707.9650524636606544888.stgit@warthog.procyon.org.uk>
In-Reply-To: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 23 Apr 2021 09:55:53 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH v7 29/31] afs: Use the fs operation ops to
 handle FetchData completion
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

Use the 'success' and 'aborted' afs_operations_ops methods and add a
'failed' method to handle the completion of an AFS.FetchData,
AFS.FetchData64 or YFS.FetchData64 RPC operation rather than directly
calling the done func pointed to by the afs_read struct from the call
delivery handler.

This means the done function will be called back on error also, not just on
successful completion.

This allows motion towards asynchronous data reception on data fetch calls
and allows any error to be handed off to the fscache read helper in the
same place as a successful completion.

Signed-off-by: David Howells <dhowells@redhat.com>
Tested-By: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/160588541471.3465195.8807019223378490810.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118157260.1232039.6549085372718234792.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161052647.2537118.12922380836599003659.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340417106.1303470.3502017303898569631.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539560673.286939.391310781674212229.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/161653816367.2770958.5856904574822446404.stgit@warthog.procyon.org.uk/ # v5
Link: https://lore.kernel.org/r/161789099994.6155.473719823490561190.stgit@warthog.procyon.org.uk/ # v6
---

 fs/afs/file.c         |   15 +++++++++++++++
 fs/afs/fs_operation.c |    4 +++-
 fs/afs/fsclient.c     |    3 ---
 fs/afs/internal.h     |    1 +
 fs/afs/yfsclient.c    |    3 ---
 5 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index edf21c8708a3..2db810467d3f 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -254,6 +254,19 @@ void afs_put_read(struct afs_read *req)
 	}
 }
 
+static void afs_fetch_data_notify(struct afs_operation *op)
+{
+	struct afs_read *req = op->fetch.req;
+	int error = op->error;
+
+	if (error == -ECONNABORTED)
+		error = afs_abort_to_error(op->ac.abort_code);
+	req->error = error;
+
+	if (req->done)
+		req->done(req);
+}
+
 static void afs_fetch_data_success(struct afs_operation *op)
 {
 	struct afs_vnode *vnode = op->file[0].vnode;
@@ -262,6 +275,7 @@ static void afs_fetch_data_success(struct afs_operation *op)
 	afs_vnode_commit_status(op, &op->file[0]);
 	afs_stat_v(vnode, n_fetches);
 	atomic_long_add(op->fetch.req->actual_len, &op->net->n_fetch_bytes);
+	afs_fetch_data_notify(op);
 }
 
 static void afs_fetch_data_put(struct afs_operation *op)
@@ -275,6 +289,7 @@ static const struct afs_operation_ops afs_fetch_data_operation = {
 	.issue_yfs_rpc	= yfs_fs_fetch_data,
 	.success	= afs_fetch_data_success,
 	.aborted	= afs_check_for_remote_deletion,
+	.failed		= afs_fetch_data_notify,
 	.put		= afs_fetch_data_put,
 };
 
diff --git a/fs/afs/fs_operation.c b/fs/afs/fs_operation.c
index 71c58723763d..2cb0951acca6 100644
--- a/fs/afs/fs_operation.c
+++ b/fs/afs/fs_operation.c
@@ -198,8 +198,10 @@ void afs_wait_for_operation(struct afs_operation *op)
 	case -ECONNABORTED:
 		if (op->ops->aborted)
 			op->ops->aborted(op);
-		break;
+		fallthrough;
 	default:
+		if (op->ops->failed)
+			op->ops->failed(op);
 		break;
 	}
 
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 31e6b3635541..5e34f4dbd385 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -392,9 +392,6 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		break;
 	}
 
-	if (req->done)
-		req->done(req);
-
 	_leave(" = 0 [done]");
 	return 0;
 }
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 9629b6430a52..ee283e3ebc4d 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -742,6 +742,7 @@ struct afs_operation_ops {
 	void (*issue_yfs_rpc)(struct afs_operation *op);
 	void (*success)(struct afs_operation *op);
 	void (*aborted)(struct afs_operation *op);
+	void (*failed)(struct afs_operation *op);
 	void (*edit_dir)(struct afs_operation *op);
 	void (*put)(struct afs_operation *op);
 };
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 363d6dd276c0..2b35cba8ad62 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -449,9 +449,6 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		break;
 	}
 
-	if (req->done)
-		req->done(req);
-
 	_leave(" = 0 [done]");
 	return 0;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

