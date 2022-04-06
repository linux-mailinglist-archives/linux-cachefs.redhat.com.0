Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516B4F6E50
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qzJBXvhBNHZK7Ip291nJm1vId3Dw/ogc6NR1j1vpxx4=;
	b=JYuM0vfhwE9zlce6UD7ygaupRyhivXUXA9jvNpsY8gThFMd3K3pFDM3UKloip1IZw8un+1
	+UUq3ZsfoBUwwVVeY8+mE/dy0C+TL3U70ojxwYpPAk6ryIRVOqLhvza2X5pj3ZA6qxyLw7
	KSs4fuVBOTZvl921Tp++RTCUwh65vRk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-29g636liMDicyD5-hs0zZw-1; Wed, 06 Apr 2022 19:04:48 -0400
X-MC-Unique: 29g636liMDicyD5-hs0zZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6275899EC1;
	Wed,  6 Apr 2022 23:04:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCBD5407DEC7;
	Wed,  6 Apr 2022 23:04:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FAC4194036B;
	Wed,  6 Apr 2022 23:04:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0AF51949763 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:04:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D1004145B974; Wed,  6 Apr 2022 23:04:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70BFC145B973;
 Wed,  6 Apr 2022 23:04:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:04:43 +0100
Message-ID: <164928628373.457102.3447384159737994076.stgit@warthog.procyon.org.uk>
In-Reply-To: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
References: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 11/14] cifs: Clamp length according to
 credits and rsize
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A read request can get expanded beyond the capacity of the available
credits and rsize, so use the ->clamp_length() method to cut the request up
into pieces rather than trying to do it in ->issue_read(), at which point
the subrequest size is already determined.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
---

 fs/cifs/cifsglob.h |    2 +
 fs/cifs/file.c     |   71 ++++++++++++++++++++++++++++++++++++----------------
 fs/cifs/smb2pdu.c  |    5 ++--
 3 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index e1e77225d634..2b1930a918b0 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -1328,8 +1328,10 @@ struct cifs_io_subrequest {
 	__u64				offset;
 	ssize_t				got_bytes;
 	unsigned int			bytes;
+	unsigned int			xid;
 	pid_t				pid;
 	int				result;
+	bool				have_credits;
 	struct kvec			iov[2];
 	struct TCP_Server_Info		*server;
 #ifdef CONFIG_CIFS_SMB_DIRECT
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 45510bd1f702..12663d9d1e51 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -3437,6 +3437,47 @@ int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return rc;
 }
 
+/*
+ * Split the read up according to how many credits we can get for each piece.
+ * It's okay to sleep here if we need to wait for more credit to become
+ * available.
+ *
+ * We also choose the server and allocate an operation ID to be cleaned up
+ * later.
+ */
+static bool cifs_clamp_length(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *rreq = subreq->rreq;
+	struct TCP_Server_Info *server;
+	struct cifs_io_subrequest *rdata = container_of(subreq, struct cifs_io_subrequest, subreq);
+	struct cifs_io_request *req = container_of(subreq->rreq, struct cifs_io_request, rreq);
+	struct cifs_sb_info *cifs_sb = CIFS_SB(rreq->inode->i_sb);
+	unsigned int rsize = 0;
+	int rc;
+
+	rdata->xid = get_xid();
+
+	server = cifs_pick_channel(tlink_tcon(req->cfile->tlink)->ses);
+	rdata->server = server;
+
+	if (cifs_sb->ctx->rsize == 0)
+		cifs_sb->ctx->rsize =
+			server->ops->negotiate_rsize(tlink_tcon(req->cfile->tlink),
+						     cifs_sb->ctx);
+
+
+	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize, &rsize,
+					   &rdata->credits);
+	if (rc) {
+		subreq->error = rc;
+		return false;
+	}
+
+	rdata->have_credits = true;
+	subreq->len = min_t(size_t, subreq->len, rsize);
+	return true;
+}
+
 /*
  * Issue a read operation on behalf of the netfs helper functions.  We're asked
  * to make a read of a certain size at a point in the file.  We are permitted
@@ -3446,24 +3487,17 @@ int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 {
 	struct netfs_io_request *rreq = subreq->rreq;
-	struct TCP_Server_Info *server;
 	struct cifs_io_subrequest *rdata = container_of(subreq, struct cifs_io_subrequest, subreq);
 	struct cifs_io_request *req = container_of(subreq->rreq, struct cifs_io_request, rreq);
 	struct cifs_sb_info *cifs_sb = CIFS_SB(rreq->inode->i_sb);
-	unsigned int xid;
 	pid_t pid;
 	int rc = 0;
-	unsigned int rsize;
-
-	xid = get_xid();
 
 	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RWPIDFORWARD)
 		pid = req->cfile->pid;
 	else
 		pid = current->tgid; // Ummm...  This may be a workqueue
 
-	server = cifs_pick_channel(tlink_tcon(req->cfile->tlink)->ses);
-
 	cifs_dbg(FYI, "%s: op=%08x[%x] mapping=%p len=%zu/%zu\n",
 		 __func__, rreq->debug_id, subreq->debug_index, rreq->mapping,
 		 subreq->transferred, subreq->len);
@@ -3476,32 +3510,20 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 			goto out;
 	}
 
-	if (cifs_sb->ctx->rsize == 0)
-		cifs_sb->ctx->rsize =
-			server->ops->negotiate_rsize(tlink_tcon(req->cfile->tlink),
-						     cifs_sb->ctx);
-
-	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize, &rsize,
-					   &rdata->credits);
-	if (rc)
-		goto out;
-
 	__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
-	rdata->server	= server;
 	rdata->offset	= subreq->start + subreq->transferred;
 	rdata->bytes	= subreq->len   - subreq->transferred;
 	rdata->pid	= pid;
 
-	rc = adjust_credits(server, &rdata->credits, rdata->bytes);
+	rc = adjust_credits(rdata->server, &rdata->credits, rdata->bytes);
 	if (!rc) {
 		if (rdata->req->cfile->invalidHandle)
 			rc = -EAGAIN;
 		else
-			rc = server->ops->async_readv(rdata);
+			rc = rdata->server->ops->async_readv(rdata);
 	}
 
 out:
-	free_xid(xid);
 	if (rc)
 		netfs_subreq_terminated(subreq, rc, false);
 }
@@ -3580,6 +3602,7 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 {
 	struct cifs_io_subrequest *rdata =
 		container_of(subreq, struct cifs_io_subrequest, subreq);
+	int rc;
 
 	if (rdata->subreq.source == NETFS_DOWNLOAD_FROM_SERVER) {
 #ifdef CONFIG_CIFS_SMB_DIRECT
@@ -3589,7 +3612,10 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 		}
 #endif
 
-		add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
+		if (rdata->have_credits)
+			add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
+		rc = subreq->error;
+		free_xid(rdata->xid);
 	}
 }
 
@@ -3601,6 +3627,7 @@ const struct netfs_request_ops cifs_req_ops = {
 	.free_subrequest	= cifs_free_subrequest,
 	.begin_cache_operation	= cifs_begin_cache_operation,
 	.expand_readahead	= cifs_expand_readahead,
+	.clamp_length		= cifs_clamp_length,
 	.issue_read		= cifs_req_issue_read,
 	.done			= cifs_rreq_done,
 };
diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 6a8aaa003e54..952f242bee55 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -4174,7 +4174,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
 #endif
 	if (rdata->result && rdata->result != -ENODATA) {
 		cifs_stats_fail_inc(tcon, SMB2_READ_HE);
-		trace_smb3_read_err(0 /* xid */,
+		trace_smb3_read_err(rdata->xid,
 				    rdata->req->cfile->fid.persistent_fid,
 				    tcon->tid, tcon->ses->Suid, rdata->offset,
 				    rdata->bytes, rdata->result);
@@ -4193,6 +4193,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
 	}
 	if (rdata->result == 0 || rdata->result == -EAGAIN)
 		iov_iter_advance(&rdata->subreq.iter, rdata->got_bytes);
+	rdata->have_credits = false;
 	netfs_subreq_terminated(&rdata->subreq,
 				(rdata->result == 0 || rdata->result == -EAGAIN) ?
 				rdata->got_bytes : rdata->result, true);
@@ -4259,7 +4260,7 @@ smb2_async_readv(struct cifs_io_subrequest *rdata)
 			     &rdata->credits);
 	if (rc) {
 		cifs_stats_fail_inc(io_parms.tcon, SMB2_READ_HE);
-		trace_smb3_read_err(0 /* xid */, io_parms.persistent_fid,
+		trace_smb3_read_err(rdata->xid, io_parms.persistent_fid,
 				    io_parms.tcon->tid,
 				    io_parms.tcon->ses->Suid,
 				    io_parms.offset, io_parms.length, rc);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

