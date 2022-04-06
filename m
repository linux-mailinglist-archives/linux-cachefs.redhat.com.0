Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A84F6E47
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AcJyvmBQ22GaJaNAG/826/AggrWvXbnf/2V8bm7MWw4=;
	b=KM902+TWL0PGN9rUjb84aVviEcC1UxavKBM6ys/srYLXcrY2ZxpGEJ51ZMvo8TITYv+7Iv
	yelagJ7FG2RDDoUMD5XZX2lxd7b+TWalrJ/qgSwSYPGdZirZxxPikv9V52bdu6YCPEszup
	HHWl9bqftuW/62rHtBdZd8hCJ4dI3rk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-8r3Ng3ViNlm9PAWNvsbFqA-1; Wed, 06 Apr 2022 19:04:40 -0400
X-MC-Unique: 8r3Ng3ViNlm9PAWNvsbFqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE498101AA42;
	Wed,  6 Apr 2022 23:04:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C441AC28102;
	Wed,  6 Apr 2022 23:04:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DFA6194036B;
	Wed,  6 Apr 2022 23:04:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7C001949763 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:04:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A213145B974; Wed,  6 Apr 2022 23:04:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A0CB145B973;
 Wed,  6 Apr 2022 23:04:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:04:36 +0100
Message-ID: <164928627647.457102.2829578394147148029.stgit@warthog.procyon.org.uk>
In-Reply-To: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
References: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 10/14] cifs: Hold the open file on
 netfs_io_request, not netfs_io_subrequest
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hold the file open on the netfs_io_request rather than on the
netfs_io_subrequest struct, thereby sharing the open file with all
subrequests contributing to a request.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
---

 fs/cifs/cifsglob.h |   12 ++++++++++--
 fs/cifs/cifssmb.c  |    6 +++---
 fs/cifs/file.c     |   32 +++++++++++++++++++++-----------
 fs/cifs/smb2pdu.c  |   14 +++++++-------
 4 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 61b40721178a..e1e77225d634 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -1313,10 +1313,18 @@ struct cifs_aio_ctx {
 	bool			direct_io;
 };
 
+struct cifs_io_request {
+	struct netfs_io_request		rreq;
+	struct cifsFileInfo		*cfile;
+};
+
 /* asynchronous read support */
 struct cifs_io_subrequest {
-	struct netfs_io_subrequest	subreq;
-	struct cifsFileInfo		*cfile;
+	union {
+		struct netfs_io_subrequest subreq;
+		struct netfs_io_request *rreq;
+		struct cifs_io_request *req;
+	};
 	__u64				offset;
 	ssize_t				got_bytes;
 	unsigned int			bytes;
diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index f736493746b4..0c039eee1234 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -1570,7 +1570,7 @@ static void
 cifs_readv_callback(struct mid_q_entry *mid)
 {
 	struct cifs_io_subrequest *rdata = mid->callback_data;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	struct TCP_Server_Info *server = tcon->ses->server;
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 2,
@@ -1628,7 +1628,7 @@ cifs_async_readv(struct cifs_io_subrequest *rdata)
 	int rc;
 	READ_REQ *smb = NULL;
 	int wct;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 2 };
 
@@ -1653,7 +1653,7 @@ cifs_async_readv(struct cifs_io_subrequest *rdata)
 	smb->hdr.PidHigh = cpu_to_le16((__u16)(rdata->pid >> 16));
 
 	smb->AndXCommand = 0xFF;	/* none */
-	smb->Fid = rdata->cfile->fid.netfid;
+	smb->Fid = rdata->req->cfile->fid.netfid;
 	smb->OffsetLow = cpu_to_le32(rdata->offset & 0xFFFFFFFF);
 	if (wct == 12)
 		smb->OffsetHigh = cpu_to_le32(rdata->offset >> 32);
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index fc3a46f7e2cf..45510bd1f702 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -3448,7 +3448,7 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 	struct netfs_io_request *rreq = subreq->rreq;
 	struct TCP_Server_Info *server;
 	struct cifs_io_subrequest *rdata = container_of(subreq, struct cifs_io_subrequest, subreq);
-	struct cifsFileInfo *open_file = rreq->netfs_priv;
+	struct cifs_io_request *req = container_of(subreq->rreq, struct cifs_io_request, rreq);
 	struct cifs_sb_info *cifs_sb = CIFS_SB(rreq->inode->i_sb);
 	unsigned int xid;
 	pid_t pid;
@@ -3458,19 +3458,19 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 	xid = get_xid();
 
 	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RWPIDFORWARD)
-		pid = open_file->pid;
+		pid = req->cfile->pid;
 	else
 		pid = current->tgid; // Ummm...  This may be a workqueue
 
-	server = cifs_pick_channel(tlink_tcon(open_file->tlink)->ses);
+	server = cifs_pick_channel(tlink_tcon(req->cfile->tlink)->ses);
 
 	cifs_dbg(FYI, "%s: op=%08x[%x] mapping=%p len=%zu/%zu\n",
 		 __func__, rreq->debug_id, subreq->debug_index, rreq->mapping,
 		 subreq->transferred, subreq->len);
 
-	if (open_file->invalidHandle) {
+	if (req->cfile->invalidHandle) {
 		do {
-			rc = cifs_reopen_file(open_file, true);
+			rc = cifs_reopen_file(req->cfile, true);
 		} while (rc == -EAGAIN);
 		if (rc)
 			goto out;
@@ -3478,7 +3478,7 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 
 	if (cifs_sb->ctx->rsize == 0)
 		cifs_sb->ctx->rsize =
-			server->ops->negotiate_rsize(tlink_tcon(open_file->tlink),
+			server->ops->negotiate_rsize(tlink_tcon(req->cfile->tlink),
 						     cifs_sb->ctx);
 
 	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize, &rsize,
@@ -3487,7 +3487,6 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 		goto out;
 
 	__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
-	rdata->cfile	= cifsFileInfo_get(open_file);
 	rdata->server	= server;
 	rdata->offset	= subreq->start + subreq->transferred;
 	rdata->bytes	= subreq->len   - subreq->transferred;
@@ -3495,7 +3494,7 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 
 	rc = adjust_credits(server, &rdata->credits, rdata->bytes);
 	if (!rc) {
-		if (rdata->cfile->invalidHandle)
+		if (rdata->req->cfile->invalidHandle)
 			rc = -EAGAIN;
 		else
 			rc = server->ops->async_readv(rdata);
@@ -3509,7 +3508,10 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 
 static int cifs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
-	rreq->netfs_priv = file->private_data;
+	struct cifs_io_request *req = container_of(rreq, struct cifs_io_request, rreq);
+	struct cifsFileInfo *open_file = file->private_data;
+
+	req->cfile = cifsFileInfo_get(open_file);
 	return 0;
 }
 
@@ -3566,6 +3568,14 @@ static int cifs_begin_cache_operation(struct netfs_io_request *rreq)
 #endif
 }
 
+static void cifs_free_request(struct netfs_io_request *rreq)
+{
+	struct cifs_io_request *req = container_of(rreq, struct cifs_io_request, rreq);
+
+	if (req->cfile)
+		cifsFileInfo_put(req->cfile);
+}
+
 static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 {
 	struct cifs_io_subrequest *rdata =
@@ -3580,14 +3590,14 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 #endif
 
 		add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
-		if (rdata->cfile)
-			cifsFileInfo_put(rdata->cfile);
 	}
 }
 
 const struct netfs_request_ops cifs_req_ops = {
+	.io_request_size	= sizeof(struct cifs_io_request),
 	.io_subrequest_size	= sizeof(struct cifs_io_subrequest),
 	.init_request		= cifs_init_request,
+	.free_request		= cifs_free_request,
 	.free_subrequest	= cifs_free_subrequest,
 	.begin_cache_operation	= cifs_begin_cache_operation,
 	.expand_readahead	= cifs_expand_readahead,
diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 696e38da9ae7..6a8aaa003e54 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -4110,7 +4110,7 @@ static void
 smb2_readv_callback(struct mid_q_entry *mid)
 {
 	struct cifs_io_subrequest *rdata = mid->callback_data;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	struct TCP_Server_Info *server = rdata->server;
 	struct smb2_hdr *shdr =
 				(struct smb2_hdr *)rdata->iov[0].iov_base;
@@ -4175,12 +4175,12 @@ smb2_readv_callback(struct mid_q_entry *mid)
 	if (rdata->result && rdata->result != -ENODATA) {
 		cifs_stats_fail_inc(tcon, SMB2_READ_HE);
 		trace_smb3_read_err(0 /* xid */,
-				    rdata->cfile->fid.persistent_fid,
+				    rdata->req->cfile->fid.persistent_fid,
 				    tcon->tid, tcon->ses->Suid, rdata->offset,
 				    rdata->bytes, rdata->result);
 	} else
 		trace_smb3_read_done(0 /* xid */,
-				     rdata->cfile->fid.persistent_fid,
+				     rdata->req->cfile->fid.persistent_fid,
 				     tcon->tid, tcon->ses->Suid,
 				     rdata->offset, rdata->got_bytes);
 
@@ -4211,7 +4211,7 @@ smb2_async_readv(struct cifs_io_subrequest *rdata)
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 1 };
 	struct TCP_Server_Info *server;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	unsigned int total_len;
 
 	cifs_dbg(FYI, "%s: offset=%llu bytes=%u\n",
@@ -4220,12 +4220,12 @@ smb2_async_readv(struct cifs_io_subrequest *rdata)
 	if (!rdata->server)
 		rdata->server = cifs_pick_channel(tcon->ses);
 
-	io_parms.tcon = tlink_tcon(rdata->cfile->tlink);
+	io_parms.tcon = tlink_tcon(rdata->req->cfile->tlink);
 	io_parms.server = server = rdata->server;
 	io_parms.offset = rdata->offset;
 	io_parms.length = rdata->bytes;
-	io_parms.persistent_fid = rdata->cfile->fid.persistent_fid;
-	io_parms.volatile_fid = rdata->cfile->fid.volatile_fid;
+	io_parms.persistent_fid = rdata->req->cfile->fid.persistent_fid;
+	io_parms.volatile_fid = rdata->req->cfile->fid.volatile_fid;
 	io_parms.pid = rdata->pid;
 
 	rc = smb2_new_read_req(


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

