Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D2467412
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 10:29:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-uON3m9S8PTq8gHvP0RezGg-1; Fri, 03 Dec 2021 04:29:50 -0500
X-MC-Unique: uON3m9S8PTq8gHvP0RezGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D581023F4E;
	Fri,  3 Dec 2021 09:29:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A3445D64;
	Fri,  3 Dec 2021 09:29:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19BB94CA93;
	Fri,  3 Dec 2021 09:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B39Tjhh032358 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 04:29:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC411C23DB3; Fri,  3 Dec 2021 09:29:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7DC2C23DB2
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:29:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADDB8803DDA
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:29:45 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-436-gL4V9JjqOWm0LWH6zH2FLw-1; Fri, 03 Dec 2021 04:29:43 -0500
X-MC-Unique: gL4V9JjqOWm0LWH6zH2FLw-1
Received: by mail-ed1-f46.google.com with SMTP id l25so8831870eda.11;
	Fri, 03 Dec 2021 01:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+fTpQsiVspdrwNhGEHy3nxuV6g89hhbjw8PRloN3S0g=;
	b=FUabAC9xSN8RjKNMUyoay77svBvCueKlfrBSpFlvMkvhpLd1u0C1/40ZieVExLvb0V
	DQ+GDIchDAvOJw7gPx988VoqHTYIxutlsGzN8zJwXJpe2avRhlL21yvppjpasED9fcfi
	ysHmds+xf8qz9ND9enu+i8ouQzOkCfZCKWrNAsmGH/JDPzY2VmuC5aKmqfDsGFyFl9Ex
	te8QXMZ6AuP7acBJCduCpiIKkB2zD3PqrcZreCQDlW/iS9mVdj9adPP3vv1GIBeDOG0H
	vVK2mhX9DgQfioD1+/Q4XwtGY3ZkkVhvSvaTdWnXC5hmsmUklrko7bfsTFQwfEYJHE5p
	MTaQ==
X-Gm-Message-State: AOAM533hr4GixVFVafM/302ON2eR5KNJLg3aejtn3mT6Q9iq39LKtT1m
	hge68j7qPdw8hMDYwXVbCX4zBjOnp4Ui4aHSIXk2Kk711VmZY5uS
X-Google-Smtp-Source: ABdhPJz3t08bFdTixoOJSVOQ+knQee+tCLa2FLW5z74Q5D9T14EIKfiObOlnKXdZ9e8ZrziKU36l59t2KEKFHMkWV5E=
X-Received: by 2002:a05:6402:1292:: with SMTP id
	w18mr25097887edv.46.1638523781628; 
	Fri, 03 Dec 2021 01:29:41 -0800 (PST)
MIME-Version: 1.0
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Fri, 3 Dec 2021 14:59:30 +0530
Message-ID: <CANT5p=oTtfOJxq009jzGLEWxztShPa3cORzHjriO2DNRU8KDtA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] cifs: avoid use of dstaddr as key for
	fscache client cookie
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

server->dstaddr can change when the DNS mapping for the
server hostname changes. But conn_id is a u64 counter
that is incremented each time a new TCP connection
is setup. So use only that as a key.

Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
---
 fs/cifs/fscache.c | 38 +-------------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index 1db3437f3b7d..003c5f1f4dfb 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -16,14 +16,6 @@
  * Key layout of CIFS server cache index object
  */
 struct cifs_server_key {
- struct {
- uint16_t family; /* address family */
- __be16 port; /* IP port */
- } hdr;
- union {
- struct in_addr ipv4_addr;
- struct in6_addr ipv6_addr;
- };
  __u64 conn_id;
 } __packed;

@@ -32,11 +24,7 @@ struct cifs_server_key {
  */
 void cifs_fscache_get_client_cookie(struct TCP_Server_Info *server)
 {
- const struct sockaddr *sa = (struct sockaddr *) &server->dstaddr;
- const struct sockaddr_in *addr = (struct sockaddr_in *) sa;
- const struct sockaddr_in6 *addr6 = (struct sockaddr_in6 *) sa;
  struct cifs_server_key key;
- uint16_t key_len = sizeof(key.hdr);

  /*
  * Check if cookie was already initialized so don't reinitialize it.
@@ -47,36 +35,12 @@ void cifs_fscache_get_client_cookie(struct
TCP_Server_Info *server)
  return;

  memset(&key, 0, sizeof(key));
-
- /*
- * Should not be a problem as sin_family/sin6_family overlays
- * sa_family field
- */
- key.hdr.family = sa->sa_family;
- switch (sa->sa_family) {
- case AF_INET:
- key.hdr.port = addr->sin_port;
- key.ipv4_addr = addr->sin_addr;
- key_len += sizeof(key.ipv4_addr);
- break;
-
- case AF_INET6:
- key.hdr.port = addr6->sin6_port;
- key.ipv6_addr = addr6->sin6_addr;
- key_len += sizeof(key.ipv6_addr);
- break;
-
- default:
- cifs_dbg(VFS, "Unknown network family '%d'\n", sa->sa_family);
- server->fscache = NULL;
- return;
- }
  key.conn_id = server->conn_id;

  server->fscache =
  fscache_acquire_cookie(cifs_fscache_netfs.primary_index,
        &cifs_fscache_server_index_def,
-       &key, key_len,
+       &key, sizeof(key),
        NULL, 0,
        server, 0, true);
  cifs_dbg(FYI, "%s: (0x%p/0x%p)\n",

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

