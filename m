Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B846740D
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 10:29:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-_WfxHFXFMMydKG1vCUwt2A-1; Fri, 03 Dec 2021 04:29:12 -0500
X-MC-Unique: _WfxHFXFMMydKG1vCUwt2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 807A73E741;
	Fri,  3 Dec 2021 09:29:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E82ADD5;
	Fri,  3 Dec 2021 09:29:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E435C1809CBA;
	Fri,  3 Dec 2021 09:29:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B39NCgg032004 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 04:23:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A8D5B2166B40; Fri,  3 Dec 2021 09:23:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A36A92166B26
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:23:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1995185A7B4
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:23:09 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-221-CwEbdgDgNiCaurOyjquHcw-1; Fri, 03 Dec 2021 04:23:06 -0500
X-MC-Unique: CwEbdgDgNiCaurOyjquHcw-1
Received: by mail-ed1-f51.google.com with SMTP id v1so9033059edx.2;
	Fri, 03 Dec 2021 01:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=j27payZnbMPznvXusDuTVgaJvzoMKNS6XqlWtcSodTI=;
	b=AEzRmdup6zk/tuhps7izh5OZHjoSEVd92eJZVG2ZVyDWVg8a9h/rB1Lj2Os/yMh0OL
	xHAmwty4Qr8hX0nYj0vIteHH5AUsPv/ORJ5gZzFz0jDuRHNSW596W1RA5oSL/+Zj7FNp
	+3ZfgyGeDAQykh9k7y4I01Ujhs1i3yE13XkTXO5U/oWnPT4CZD/FB8DS4P1mQksfzyZW
	33KRJWoo/EnsOWSyN3TRSKSLWc5dmU1iC0shRDK6mfmbjZn1qCPWUpRCEJdTRDsJaa/b
	N7I7VUDjzzTX6/MpJvzNClCDrnjDFb1cxlqcfw600Q2gIHro99ldp9+2qD8dn5jkPInA
	3Lnw==
X-Gm-Message-State: AOAM5306qKeHa+DmNcRKw/IkbGCE3GmnihLsfQJrHyOUXC0K/xB98rXN
	Q0BKiS2qhcmRCpZUV6RGJK7j2ieJDS0OJVuRtYqTv2hXl76mwQKg
X-Google-Smtp-Source: ABdhPJxC6LryHGqjtNB+BOM6xDEMswi78yhQYrIc7+oDrGxIIxZZnxmjxbKPa59lJRe3llBKXp/S7LSbbkpRsbDDYVM=
X-Received: by 2002:a17:907:6e8e:: with SMTP id
	sh14mr21790957ejc.536.1638523384191; 
	Fri, 03 Dec 2021 01:23:04 -0800 (PST)
MIME-Version: 1.0
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Fri, 3 Dec 2021 14:52:53 +0530
Message-ID: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Jeff Layton <jlayton@redhat.com>,
	Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Paulo Alcantara <pc@cjr.nz>, linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] cifs: wait for tcon resource_id before
	getting fscache super
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The logic for initializing tcon->resource_id is done inside
cifs_root_iget. fscache super cookie relies on this for aux
data. So we need to push the fscache initialization to this
later point during mount.

Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
---
 fs/cifs/connect.c | 6 ------
 fs/cifs/fscache.c | 2 +-
 fs/cifs/inode.c   | 7 +++++++
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 6b705026da1a3..eee994b0925ff 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3046,12 +3046,6 @@ static int mount_get_conns(struct mount_ctx *mnt_ctx)
  cifs_dbg(VFS, "read only mount of RW share\n");
  /* no need to log a RW mount of a typical RW share */
  }
- /*
- * The cookie is initialized from volume info returned above.
- * Inside cifs_fscache_get_super_cookie it checks
- * that we do not get super cookie twice.
- */
- cifs_fscache_get_super_cookie(tcon);
  }

  /*
diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
index 7e409a38a2d7c..f4da693760c11 100644
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -92,7 +92,7 @@ void cifs_fscache_get_super_cookie(struct cifs_tcon *tcon)
  * In the future, as we integrate with newer fscache features,
  * we may want to instead add a check if cookie has changed
  */
- if (tcon->fscache == NULL)
+ if (tcon->fscache)
  return;

  sharename = extract_sharename(tcon->treeName);
diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 82848412ad852..96d083db17372 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -1376,6 +1376,13 @@ struct inode *cifs_root_iget(struct super_block *sb)
  inode = ERR_PTR(rc);
  }

+ /*
+ * The cookie is initialized from volume info returned above.
+ * Inside cifs_fscache_get_super_cookie it checks
+ * that we do not get super cookie twice.
+ */
+ cifs_fscache_get_super_cookie(tcon);
+
 out:
  kfree(path);
  free_xid(xid);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

