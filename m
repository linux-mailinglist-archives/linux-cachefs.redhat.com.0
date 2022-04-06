Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D994F6E53
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 01:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649286303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ewBLxZiP56EMhpEfiOFsv6pMPO2q51DI29anj47Jhug=;
	b=PPsfdiDouZTe4MKDuBRRfAQvWhUjxRo/LsnW7uf5A4ccTMDBl1zRMC94QPIArBMjTrSmqE
	RdWSivCgZSkSKpmFf/CurtWtq+tzm/mKekgUn2Rk2VgE78ZftjCl4Fb7cLRHPdlhtktgdl
	+j7anSgnnX5GnWeuEG5OxxBCfDIrMOg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-Qtq3uEa_MpG7NExl-KRwtA-1; Wed, 06 Apr 2022 19:05:03 -0400
X-MC-Unique: Qtq3uEa_MpG7NExl-KRwtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FF183803929;
	Wed,  6 Apr 2022 23:05:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45704407E1DD;
	Wed,  6 Apr 2022 23:05:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB6E6194036B;
	Wed,  6 Apr 2022 23:05:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B2D2C194034C for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 23:05:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 948CD40470DF; Wed,  6 Apr 2022 23:05:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33D0B40470ED;
 Wed,  6 Apr 2022 23:04:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 07 Apr 2022 00:04:58 +0100
Message-ID: <164928629846.457102.2012832611244620467.stgit@warthog.procyon.org.uk>
In-Reply-To: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
References: <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH 13/14] cifs: Split the smb3_add_credits
 tracepoint
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

Split the smb3_add_credits tracepoint to make it more obvious when looking
at the logs which line corresponds to what credit change.  Also add a
tracepoint for credit overflow when it's being added back.

Note that it might be better to add another field to the tracepoint to store
the information rather than splitting it.  It would also be useful to store
the MID potentially, though that isn't available when the credits are first
obtained.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
---

 fs/cifs/connect.c   |    2 +-
 fs/cifs/smb2ops.c   |    9 ++++++---
 fs/cifs/trace.h     |    7 +++++++
 fs/cifs/transport.c |    4 ++--
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 080e19e9ee47..dab0e9f93708 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -1062,7 +1062,7 @@ smb2_add_credits_from_hdr(char *buffer, struct TCP_Server_Info *server)
 		spin_unlock(&server->req_lock);
 		wake_up(&server->request_q);
 
-		trace_smb3_add_credits(server->CurrentMid,
+		trace_smb3_hdr_credits(server->CurrentMid,
 				server->conn_id, server->hostname, scredits,
 				le16_to_cpu(shdr->CreditRequest), in_flight);
 		cifs_server_dbg(FYI, "%s: added %u credits total=%d\n",
diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 03bd64933b7b..cf248309528a 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -86,6 +86,9 @@ smb2_add_credits(struct TCP_Server_Info *server,
 	if (*val > 65000) {
 		*val = 65000; /* Don't get near 64K credits, avoid srv bugs */
 		pr_warn_once("server overflowed SMB3 credits\n");
+		trace_smb3_overflow_credits(server->CurrentMid,
+					    server->conn_id, server->hostname, *val,
+					    add, server->in_flight);
 	}
 	server->in_flight--;
 	if (server->in_flight == 0 &&
@@ -251,7 +254,7 @@ smb2_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
 	in_flight = server->in_flight;
 	spin_unlock(&server->req_lock);
 
-	trace_smb3_add_credits(server->CurrentMid,
+	trace_smb3_wait_credits(server->CurrentMid,
 			server->conn_id, server->hostname, scredits, -(credits->value), in_flight);
 	cifs_dbg(FYI, "%s: removed %u credits total=%d\n",
 			__func__, credits->value, scredits);
@@ -300,7 +303,7 @@ smb2_adjust_credits(struct TCP_Server_Info *server,
 	spin_unlock(&server->req_lock);
 	wake_up(&server->request_q);
 
-	trace_smb3_add_credits(server->CurrentMid,
+	trace_smb3_adj_credits(server->CurrentMid,
 			server->conn_id, server->hostname, scredits,
 			credits->value - new_val, in_flight);
 	cifs_dbg(FYI, "%s: adjust added %u credits total=%d\n",
@@ -2492,7 +2495,7 @@ smb2_is_status_pending(char *buf, struct TCP_Server_Info *server)
 		spin_unlock(&server->req_lock);
 		wake_up(&server->request_q);
 
-		trace_smb3_add_credits(server->CurrentMid,
+		trace_smb3_pend_credits(server->CurrentMid,
 				server->conn_id, server->hostname, scredits,
 				le16_to_cpu(shdr->CreditRequest), in_flight);
 		cifs_dbg(FYI, "%s: status pending add %u credits total=%d\n",
diff --git a/fs/cifs/trace.h b/fs/cifs/trace.h
index c85cf0971eee..d783b14c24ef 100644
--- a/fs/cifs/trace.h
+++ b/fs/cifs/trace.h
@@ -1112,6 +1112,13 @@ DEFINE_SMB3_CREDIT_EVENT(credit_timeout);
 DEFINE_SMB3_CREDIT_EVENT(insufficient_credits);
 DEFINE_SMB3_CREDIT_EVENT(too_many_credits);
 DEFINE_SMB3_CREDIT_EVENT(add_credits);
+DEFINE_SMB3_CREDIT_EVENT(adj_credits);
+DEFINE_SMB3_CREDIT_EVENT(hdr_credits);
+DEFINE_SMB3_CREDIT_EVENT(nblk_credits);
+DEFINE_SMB3_CREDIT_EVENT(pend_credits);
+DEFINE_SMB3_CREDIT_EVENT(wait_credits);
+DEFINE_SMB3_CREDIT_EVENT(waitff_credits);
+DEFINE_SMB3_CREDIT_EVENT(overflow_credits);
 DEFINE_SMB3_CREDIT_EVENT(set_credits);
 
 #endif /* _CIFS_TRACE_H */
diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index c74aa12ecc7c..4e7a3a0ddd8b 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -515,7 +515,7 @@ wait_for_free_credits(struct TCP_Server_Info *server, const int num_credits,
 		in_flight = server->in_flight;
 		spin_unlock(&server->req_lock);
 
-		trace_smb3_add_credits(server->CurrentMid,
+		trace_smb3_nblk_credits(server->CurrentMid,
 				server->conn_id, server->hostname, scredits, -1, in_flight);
 		cifs_dbg(FYI, "%s: remove %u credits total=%d\n",
 				__func__, 1, scredits);
@@ -621,7 +621,7 @@ wait_for_free_credits(struct TCP_Server_Info *server, const int num_credits,
 			in_flight = server->in_flight;
 			spin_unlock(&server->req_lock);
 
-			trace_smb3_add_credits(server->CurrentMid,
+			trace_smb3_waitff_credits(server->CurrentMid,
 					server->conn_id, server->hostname, scredits,
 					-(num_credits), in_flight);
 			cifs_dbg(FYI, "%s: remove %u credits total=%d\n",


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

