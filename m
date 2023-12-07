Return-Path: <linux-cachefs+bncBDLIXLMFVAERBPPQZCVQMGQEFL65Q6Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF18093A9
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:25:18 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67ab0fa577fsf18436436d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:25:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984317; cv=pass;
        d=google.com; s=arc-20160816;
        b=JbbsmLT1fe1VWMlkeEcdPRzTPOvxlPd92YyI3P4LjebP9+G4NFYJWzF04/tdmECrsg
         BCUftiL3i8BJnKLuo9WRCx/2dvOLFH4cENYYDZ6bgtJb8zW+CnIcPiP3RiT5XC8TLxyZ
         XzCnIpbb6vlbdqDmz0rBFjFhFrBtT2LOUz3eNZowDYWXv/mbiMyk6vUNP6qixXwMrPYP
         2UbTt7Hnpx9cZF7iiE8WVXnjtxAq34vpLWYuI5Nof/Ah5nNIibFatBi8x71/YcD+FLJV
         4ptIP1zXCUdI/q64HR6r7zBzjGJaQKONlq8ff8B0kcKNzR+zMYm3/VEjUlmzEAU/J8xA
         iqXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GW/wYGwCnDjrM6nKrz4ciAyhlieEnqscproInlyAitU=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=i0Jozir3kae93PY9y57Cx/5kpXf9kji45u/wMx8qrZ0WOwFTjksqZMGFCXgVllY8fb
         5eTBZn0KoaQ1kIkhLr3IfbC2H3lwgoMIXg7VWdcl2TP5SHGva6cm/xh7fALNhRHicn9R
         zcE0LkR1AZHi4+i5H9FD/JKWq9/AhIsd4hTnXsCIfQJBCFGJE6yC/Q59AiXzoJk+q1U9
         uGBqtleRgzzQANOX0FnvyuDYAT8iEliX8ky7GSlcZfAb8JGBXg/KplKD8Kd6k/OcFdVD
         RfKSGJTJEoKNi6wmpwriAJEtP3g56zECSciC88bRkrqwTbKWBXout3f4K5ww9sOpRXiJ
         yYIA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984317; x=1702589117;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW/wYGwCnDjrM6nKrz4ciAyhlieEnqscproInlyAitU=;
        b=fOwi8MOQHW/g+FpjZyXQMkNjWYnIviQzC7qH8ZrEntyvv8LirBTpS9+acCoM06yAbE
         LoJucywVrmKU+mA7Ploj4UwVyGr8BeqYOZPpYjboEbawS8Zp71l5Z3QyBJGgeDSwRdpb
         GqbDhKF74c61XPJ2/mc5NXjoCUi8dnPd7js+DBdNizWlwj/i6IVMEVMko5y1liw5F0VW
         zD8aDgTjf2yXYkSBl67N7VoVS7iDifmVHNiUMbmCkimRgkOdPalRpxq/xheor73KvQ7w
         nBDFAjiLTcg+HZf7Uam1eSRfAN1oDFFg+kF95+AmNxZcKoQfAxPvBBQEcHjU6sD2gcwj
         9GAQ==
X-Gm-Message-State: AOJu0YxkaM3rD7mtO3/wcbz8XcRAkhj02A9LgaKsQLFDmlE/PQQg52y6
	OfXoBBdv/+vjBw1bZ0MTZjZ/Zg==
X-Google-Smtp-Source: AGHT+IGBf9GRNsk66fJ/0J/V3HGyN8/WcjwCMG304tLw1MaRDHRjQdIjtQ8SyViBnSQ/Ay/923LA7Q==
X-Received: by 2002:a0c:e907:0:b0:67a:95ac:3978 with SMTP id a7-20020a0ce907000000b0067a95ac3978mr3410475qvo.53.1701984317184;
        Thu, 07 Dec 2023 13:25:17 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:945:b0:67a:a8c7:4f24 with SMTP id
 dn5-20020a056214094500b0067aa8c74f24ls1333621qvb.2.-pod-prod-02-us; Thu, 07
 Dec 2023 13:25:16 -0800 (PST)
X-Received: by 2002:a05:6102:3be4:b0:464:86b8:4c05 with SMTP id be4-20020a0561023be400b0046486b84c05mr3485046vsb.8.1701984316583;
        Thu, 07 Dec 2023 13:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984316; cv=none;
        d=google.com; s=arc-20160816;
        b=pyOjN5lZ8I44GlT3Yg1uxv0npbq+RuQ9AfKZQldStAXHaN80joiFXGqyeKAqqn4yNG
         ljOou8qAg/MZ3TearMu5XJDTur0+PLREiryhd1hB9UX7i+KgIIe1U/+z7JrF9W5rni9o
         07Rmuz6UnSdoOOTGWIqSxZH0U/f6zwo08I5aQPCqmGsLeVzCwBWY4PyPD/0MMu9pXMhN
         QWXk71WrdffGYuHnsSYf5+0yG+3WJjt4YXipkKcvt7FN/mukEuDJG/LOZ3D5DPmjwmbV
         I4IeDKhsUgfACeGT5SR+0EVyzyvudkW3iwqS/zHLPLv2A4bwQN8t3GwCWcjWT1dICkuN
         s4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=1l+FS8mq19pOpm0UjSmptv5Ycz0H+4vPP+t7D9sPQnY=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=Sise/s7yC09FBlOtCkfQWEdW+wZe5kKcdazZ4RflSVtavtda2VphFgwDGsniX12ECI
         1XbY/oztPdhWwxs9I1EIvbrE8QUHWbAQzW8RYRMXu2Qfs3BYHiFlo8fmEm/n00smu+p7
         NDj55HuVJDdgH1CAI30tdVD3WgHFIidDZQe/PjedLos/Z0Nv9PY2pLYYPXR+wYV/Ys1O
         kkCwRAbRopWscNCyw5WhCmeOr5F5qJRGrIsySmspohtGqOvTRo1UPCFU5FP04LDLMH+s
         4gnnaX87x8OrVbgiT40MV70Ol6dSeh3nOV5d01bIz8kn93vvr3CtakFQdM/OF20dt3ng
         e9MA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id n7-20020a0ce947000000b0067a97f4f39dsi646401qvo.101.2023.12.07.13.25.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-_1sdUduBOr6vueaHJpPftg-1; Thu, 07 Dec 2023 16:25:14 -0500
X-MC-Unique: _1sdUduBOr6vueaHJpPftg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 806A486C045
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:25:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7D0173C35; Thu,  7 Dec 2023 21:25:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1AD03C2E;
	Thu,  7 Dec 2023 21:25:10 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v3 52/59] cifs: Make wait_mtu_credits take size_t args
Date: Thu,  7 Dec 2023 21:21:59 +0000
Message-ID: <20231207212206.1379128-53-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Make the wait_mtu_credits functions use size_t for the size and num
arguments rather than unsigned int as netfslib uses size_t/ssize_t for
arguments and return values to allow for extra capacity.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  |  4 ++--
 fs/smb/client/cifsproto.h |  2 +-
 fs/smb/client/file.c      | 18 ++++++++++--------
 fs/smb/client/smb2ops.c   |  4 ++--
 fs/smb/client/transport.c |  4 ++--
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 80a9f15828cc..a0d348b166c2 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -512,8 +512,8 @@ struct smb_version_operations {
 	/* writepages retry size */
 	unsigned int (*wp_retry_size)(struct inode *);
 	/* get mtu credits */
-	int (*wait_mtu_credits)(struct TCP_Server_Info *, unsigned int,
-				unsigned int *, struct cifs_credits *);
+	int (*wait_mtu_credits)(struct TCP_Server_Info *, size_t,
+				size_t *, struct cifs_credits *);
 	/* adjust previously taken mtu credits to request size */
 	int (*adjust_credits)(struct TCP_Server_Info *server,
 			      struct cifs_credits *credits,
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 47c352426fcf..85e115da8899 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -121,7 +121,7 @@ extern struct mid_q_entry *cifs_setup_async_request(struct TCP_Server_Info *,
 extern int cifs_check_receive(struct mid_q_entry *mid,
 			struct TCP_Server_Info *server, bool log_error);
 extern int cifs_wait_mtu_credits(struct TCP_Server_Info *server,
-				 unsigned int size, unsigned int *num,
+				 size_t size, size_t *num,
 				 struct cifs_credits *credits);
 extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
 			struct kvec *, int /* nvec to send */,
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 16f6c15e0d06..b47abeefe628 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2733,9 +2733,9 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
 	struct cifsFileInfo *cfile = NULL;
-	unsigned int xid, wsize, len;
+	unsigned int xid, len;
 	loff_t i_size = i_size_read(inode);
-	size_t max_len;
+	size_t max_len, wsize;
 	long count = wbc->nr_to_write;
 	int rc;
 
@@ -3247,7 +3247,7 @@ static int
 cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
-	unsigned int wsize;
+	size_t wsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server = wdata->server;
@@ -3381,7 +3381,8 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 	do {
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
-		unsigned int wsize, nsegs = 0;
+		unsigned int nsegs = 0;
+		size_t wsize;
 
 		if (signal_pending(current)) {
 			rc = -EINTR;
@@ -3818,7 +3819,7 @@ static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
-	unsigned int rsize;
+	size_t rsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server;
@@ -3892,10 +3893,10 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 		     struct cifs_aio_ctx *ctx)
 {
 	struct cifs_io_subrequest *rdata;
-	unsigned int rsize, nsegs, max_segs = INT_MAX;
+	unsigned int nsegs, max_segs = INT_MAX;
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
-	size_t cur_len, max_len;
+	size_t cur_len, max_len, rsize;
 	int rc;
 	pid_t pid;
 	struct TCP_Server_Info *server;
@@ -4491,12 +4492,13 @@ static void cifs_readahead(struct readahead_control *ractl)
 	 * Chop the readahead request up into rsize-sized read requests.
 	 */
 	while ((nr_pages = ra_pages)) {
-		unsigned int i, rsize;
+		unsigned int i;
 		struct cifs_io_subrequest *rdata;
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
 		struct folio *folio;
 		pgoff_t fsize;
+		size_t rsize;
 
 		/*
 		 * Find out if we have anything cached in the range of
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index b27df9e239dd..5850d6afd788 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -216,8 +216,8 @@ smb2_get_credits(struct mid_q_entry *mid)
 }
 
 static int
-smb2_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
-		      unsigned int *num, struct cifs_credits *credits)
+smb2_wait_mtu_credits(struct TCP_Server_Info *server, size_t size,
+		      size_t *num, struct cifs_credits *credits)
 {
 	int rc = 0;
 	unsigned int scredits, in_flight;
diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index 3048516573e8..5cf653463c55 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -684,8 +684,8 @@ wait_for_compound_request(struct TCP_Server_Info *server, int num,
 }
 
 int
-cifs_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
-		      unsigned int *num, struct cifs_credits *credits)
+cifs_wait_mtu_credits(struct TCP_Server_Info *server, size_t size,
+		      size_t *num, struct cifs_credits *credits)
 {
 	*num = size;
 	credits->value = 0;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

