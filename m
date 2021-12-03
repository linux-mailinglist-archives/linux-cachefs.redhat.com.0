Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E46467411
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 10:29:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-APzCUduAM9ec-FoeX-b4Pw-1; Fri, 03 Dec 2021 04:29:41 -0500
X-MC-Unique: APzCUduAM9ec-FoeX-b4Pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83C2A3E741;
	Fri,  3 Dec 2021 09:29:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A7F19724;
	Fri,  3 Dec 2021 09:29:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CF73180B617;
	Fri,  3 Dec 2021 09:29:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B39Soua032235 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 04:28:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ADC484010E70; Fri,  3 Dec 2021 09:28:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D4140CFD0D
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:28:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9BE18162C1
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:28:50 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-573-5f-BLBE6NkCVOFzG0dYAXg-1; Fri, 03 Dec 2021 04:28:47 -0500
X-MC-Unique: 5f-BLBE6NkCVOFzG0dYAXg-1
Received: by mail-ed1-f46.google.com with SMTP id o20so8867861eds.10;
	Fri, 03 Dec 2021 01:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wR2mAEloXpBDlp4jpjzUYz+sRB/xAPIS4tW3XUdXFAU=;
	b=aidxWmVneYMszVgU3IxB/TCXdNOIdFlzSZkC2ntwKyjzd4CJ8XgD1GYqx5HTUZtX88
	3ovTWnb1aKUIV8u+G2ouDIt1XUFIL1E//UHte4MhErXJTnEoD38Lb1JZQm3tEVgRD7wV
	tnrZHQ/bp6K2viCFJXxzJZSSRlJObcjHLWwV4ETM612EBuC5Ly+6twxVWVFOW/4opj0N
	PnyuabLabpi//ZJ6xn7xsPZ8wv5kV73Fdpai+JER9zJNKEuV3rGZyMc3nHUUmahfmfxV
	7oqUnnlc/noLaDgtywatLIU3F6lvJRPl1BOS0gz9GtaZp3YvGX3vOUYmExiFZjScGXn0
	hFOA==
X-Gm-Message-State: AOAM532K8jAraxIIK/r0yyXvS1W83pZDJQBCKJk2+h5su+GVoSzJrbax
	AQvf3SGzNCt/sBpEoxmhFcfuGRmGeiFfn9lWYcsivvkd0bTOhocp
X-Google-Smtp-Source: ABdhPJwlyYsScxu5SYzQUpxyXGoKxflMI2V0i0MJ+VvxizUlVcTbJ0uDwP9uvZ5UvHQW5x6Xz2O8XSjtxlZwu6Yobog=
X-Received: by 2002:a05:6402:1613:: with SMTP id
	f19mr25009787edv.322.1638523725102; 
	Fri, 03 Dec 2021 01:28:45 -0800 (PST)
MIME-Version: 1.0
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Fri, 3 Dec 2021 14:58:34 +0530
Message-ID: <CANT5p=pqb7MmFe+kQU67Eytm98tZB1ztr0d5Rwq44oxAq81+Dw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Jeff Layton <jlayton@redhat.com>,
	Steve French <smfrench@gmail.com>, Paulo Alcantara <pc@cjr.nz>,
	CIFS <linux-cifs@vger.kernel.org>, linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] cifs: add server conn_id to fscache client
	cookie
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fscache client cookie uses the server address
(and port) as the cookie key. This is a problem when
nosharesock is used. Two different connections will
use duplicate cookies. Avoid this by adding
server->conn_id to the key, so that it's guaranteed
that cookie will not be duplicated.

Also, for secondary channels of a session, copy the
fscache pointer from the primary channel. The primary
channel is guaranteed not to go away as long as secondary
channels are in use.

Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
---
 fs/cifs/connect.c |  2 ++
 fs/cifs/fscache.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index eee994b0925f..d8822e835cc4 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -1562,6 +1562,8 @@ cifs_get_tcp_session(struct smb3_fs_context *ctx,
  /* fscache server cookies are based on primary channel only */
  if (!CIFS_SERVER_IS_CHAN(tcp_ses))
  cifs_fscache_get_client_cookie(tcp_ses);
+ else
+ tcp_ses->fscache = tcp_ses->primary_server->fscache;

  /* queue echo request delayed work */
  queue_delayed_work(cifsiod_wq, &tcp_ses->echo, tcp_ses->echo_interval);
diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index f4da693760c1..1db3437f3b7d 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -24,6 +24,7 @@ struct cifs_server_key {
  struct in_addr ipv4_addr;
  struct in6_addr ipv6_addr;
  };
+ __u64 conn_id;
 } __packed;

 /*
@@ -37,6 +38,14 @@ void cifs_fscache_get_client_cookie(struct
TCP_Server_Info *server)
  struct cifs_server_key key;
  uint16_t key_len = sizeof(key.hdr);

+ /*
+ * Check if cookie was already initialized so don't reinitialize it.
+ * In the future, as we integrate with newer fscache features,
+ * we may want to instead add a check if cookie has changed
+ */
+ if (server->fscache)
+ return;
+
  memset(&key, 0, sizeof(key));

  /*
@@ -62,6 +71,7 @@ void cifs_fscache_get_client_cookie(struct
TCP_Server_Info *server)
  server->fscache = NULL;
  return;
  }
+ key.conn_id = server->conn_id;

  server->fscache =
  fscache_acquire_cookie(cifs_fscache_netfs.primary_index,

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

