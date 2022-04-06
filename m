Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E914F6E46
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TdLIuns6EavAyDB/sck6swZWJwEAq7Hhpn7Y5s8TUrI=;
	b=Q5dsutK5V8R5kmmZaFwmU9EFdsTanD85QQNQEiLRPwFVy5YVt99QrEoldJHJA5UGftswD4
	MFlHyPNce7LpNi0hm8kN1pvwKzqaZv+Z7k7kla21SiG0VwFlcrNStbLFGqsj2etOiG5Qoq
	oQk51CLZYIz5sZz+aiMVikSa818urkg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-TCxGXBrOM9GGH3GMG5xN-A-1; Wed, 06 Apr 2022 19:04:33 -0400
X-MC-Unique: TCxGXBrOM9GGH3GMG5xN-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE8AC1C07844;
	Wed,  6 Apr 2022 23:04:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C45AB53CF;
	Wed,  6 Apr 2022 23:04:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71A87194036B;
	Wed,  6 Apr 2022 23:04:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71A5A1949763 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:04:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B6C2C28105; Wed,  6 Apr 2022 23:04:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 065CCC28102;
 Wed,  6 Apr 2022 23:04:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:04:29 +0100
Message-ID: <164928626929.457102.8462570553817391746.stgit@warthog.procyon.org.uk>
In-Reply-To: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
References: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH 09/14] cifs: Put credits into
 cifs_io_subrequest, not on the stack
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the credits into the cifs_io_subrequest struct rather than placing them
on the stack.  They are then allocated by netfslib when it allocates its
netfs_io_subrequest.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
---

 fs/cifs/file.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index fb2885134154..fc3a46f7e2cf 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -3450,7 +3450,6 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 	struct cifs_io_subrequest *rdata = container_of(subreq, struct cifs_io_subrequest, subreq);
 	struct cifsFileInfo *open_file = rreq->netfs_priv;
 	struct cifs_sb_info *cifs_sb = CIFS_SB(rreq->inode->i_sb);
-	struct cifs_credits credits_on_stack, *credits = &credits_on_stack;
 	unsigned int xid;
 	pid_t pid;
 	int rc = 0;
@@ -3482,7 +3481,8 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 			server->ops->negotiate_rsize(tlink_tcon(open_file->tlink),
 						     cifs_sb->ctx);
 
-	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize, &rsize, credits);
+	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize, &rsize,
+					   &rdata->credits);
 	if (rc)
 		goto out;
 
@@ -3492,7 +3492,6 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 	rdata->offset	= subreq->start + subreq->transferred;
 	rdata->bytes	= subreq->len   - subreq->transferred;
 	rdata->pid	= pid;
-	rdata->credits	= credits_on_stack;
 
 	rc = adjust_credits(server, &rdata->credits, rdata->bytes);
 	if (!rc) {
@@ -3502,11 +3501,6 @@ static void cifs_req_issue_read(struct netfs_io_subrequest *subreq)
 			rc = server->ops->async_readv(rdata);
 	}
 
-	if (rc) {
-		add_credits_and_wake_if(server, &rdata->credits, 0);
-		/* Fallback to the readpage in error/reconnect cases */
-	}
-
 out:
 	free_xid(xid);
 	if (rc)
@@ -3584,6 +3578,8 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 			rdata->mr = NULL;
 		}
 #endif
+
+		add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
 		if (rdata->cfile)
 			cifsFileInfo_put(rdata->cfile);
 	}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

