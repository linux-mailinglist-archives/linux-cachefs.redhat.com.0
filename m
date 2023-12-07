Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRHQZCVQMGQEHIGJFUQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9528093AE
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:25:25 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4258ff0106dsf10693831cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:25:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984324; cv=pass;
        d=google.com; s=arc-20160816;
        b=m0RRIWjtXbQB379FOVSAo9ZoIhxplWPrrM/RO9OzjLQal+xQ+u6+wwzQ8VpMG2NweU
         Joev/jXEOllGqsFsiGxR2Mu/CWw9dxJMrERHROVnDGLIbvrrVh9HFXGNQWQdv61xB0+2
         iCU3OOkcRyExUZjnxphISQA2O9rH45nz5vdHUHslPf5m3xG5iJEqbTDUxmdkHOC27KY1
         xDMgIfS2HzapAZbMmqaUrYqzLIxo+aINagOGDJROZnWyxOgjVH8uGg5PkBvBpIK64FnZ
         4CGkYNLhE+aJO/1ijfYJVTxJ7DXn5eGiC2pLXvwjWWNCbchbmCPSv0wgIy/SQlPsFMvI
         AR6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+9gE3zPm2MJyUQYxBbsFlRSjALq3bP4vCNK6uOuaGWY=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=Aszsplxrhi4NZ4d3Yu2LA4TXJeBYH3BG7kRAaPVUvPHYmUaHAunlOn9lfAfR8hVuxQ
         T3G/VAzUsfJxi8+TLiP/JLithnvxmZWAd5uwJScIFq+FuxgarpbOEcvyC85E6SYdCd7d
         ku98en9WZbA8T3bSpPPvPC3kAiE4xi5mcRO4s50EfFpO3i3YfniAliv5VK3/AW58ZRpQ
         F48LobxwC5PGYNX/83VZOOSYKifNUz0iAVG92t2qNdPphCceFBTVMdmbrd8wKrwDAOZn
         4F+6dc1t6nTEzvCQoDnqEFUi+SF+w0N0d9aKP4ltjBHSuRFSaCRLa/O5+IrEjmegsSsT
         3kwg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984324; x=1702589124;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9gE3zPm2MJyUQYxBbsFlRSjALq3bP4vCNK6uOuaGWY=;
        b=qiYj+T+8yqaqztbb7b3XvNIIiNOdaTuqXH7L8auYHEBC+vadpxzgXTfIVoDJ4xujOS
         dVktNxpKFLItvADkHVggp+QXhFVe3Es6p0J7TpPmhGynqybijPmcoRKxgfSx7RVmKFQt
         cTk4bxNOIaiPFQ0vdmz9rJnMeZl+3+CmqgyA+wdwv7Ph7HPuTOecQllPdLomIaoRotVg
         6Iu6KE4scdNhSKW1xOYxsrtTeiQMM2Q/UcQaz/fO5QbI/VpSz5LA7ezvhq7GzVxRk2i9
         rPk/GsKVpx7/27AOQRw4d0mSN2b9kdzevn6h0dgvxFRaLY4ECt1XpxMo2kzNwo2Law6Y
         XxjQ==
X-Gm-Message-State: AOJu0YzMqLSRYEL3awQ4Tl0dGpwUFfu7UIoUeleCBTOtwgqxNrJPwbxe
	7BRFSdm8jFH4ILRCeP9FgdB17g==
X-Google-Smtp-Source: AGHT+IHH4qJKhfwxhZzvhiRK1GUuVd5dhEfRw3SQNrP2uJUdSebixY9lOVRGM2aKcggNuRpM2SW4HA==
X-Received: by 2002:a05:622a:1214:b0:425:4043:4199 with SMTP id y20-20020a05622a121400b0042540434199mr4402153qtx.69.1701984324425;
        Thu, 07 Dec 2023 13:25:24 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:425:7ea5:45f0 with SMTP id
 a17-20020a05622a065100b004257ea545f0ls1592837qtb.2.-pod-prod-04-us; Thu, 07
 Dec 2023 13:25:23 -0800 (PST)
X-Received: by 2002:ac8:7f95:0:b0:425:7f1a:c49e with SMTP id z21-20020ac87f95000000b004257f1ac49emr4212933qtj.1.1701984323752;
        Thu, 07 Dec 2023 13:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984323; cv=none;
        d=google.com; s=arc-20160816;
        b=mwz6DjJZZY279GgdI+bKYd3dFB1GOPUQ/FXPQzTMlNLaSZcznMcKkqeldTvf7o9DqG
         EYjwDvUz5PEe1iesCNCWX8W9VXvAGb/niBq6qFEljD4S8TpLyzkQpwZeblKMsyX8R4Dy
         lYVk3koQOV6/wWpJH86qcohYO5mGwBQn4ofxymbWrbDYzIjKxPy8yOANyYNSfM8f/m9D
         kF335XgZyvN+LaXWgO9XlTzPp071fgVJPE6Mkv/zUVPC8AiOa9sMyYE7vtvvLleo0HOq
         bGM6/FLjVrV0DxgFNkXWWTimy7brthczb3OCATWxHQ/L5DLhEeNVawkKoH4M9XfVGCyj
         FnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=CTmXKlaARSc+/4qCQwpNxe6YLvLKHn4pqqsvYn+RGCg=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=Pf/b+UWmAs6NdOtn1lFzgjBgA6RJzkprGaghEqnzWul5j1xj3cu6r7nJnwMCyNLux+
         ogqlOGRhWqcQF1Z2a7D8st6h+if2oQbpqBtjrncAOmWZ/A7VT+cBiLbxMlQCihpFyQl5
         15VHGEpGm9sBk5VSDW5/cHqP8dDyKGSgBtWniGGwJVGyy5m9yfYvSwv52Da0JTtUhfXB
         Xu1vhs3bLjzYBpiOtim+o5qeYS9GxlgCv/duZKwxs2/9afBzaOFiwAVPkuhOhLzmZj0m
         Lxo4iXmfVReuJFlD+upTDsFO+FwpzOJm4UdmeBVhmsDBzRQWv+kk2eRZgDie3plN7Z6o
         fqQg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fe14-20020a05622a4d4e00b00423d3459f72si759110qtb.808.2023.12.07.13.25.23
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-bnpodhN4O0yLbT6LAb885w-1; Thu, 07 Dec 2023 16:25:22 -0500
X-MC-Unique: bnpodhN4O0yLbT6LAb885w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F25A785A597
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:25:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EF6563C37; Thu,  7 Dec 2023 21:25:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFF6C3C2E;
	Thu,  7 Dec 2023 21:25:18 +0000 (UTC)
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
Subject: [PATCH v3 54/59] cifs: Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c
Date: Thu,  7 Dec 2023 21:22:01 +0000
Message-ID: <20231207212206.1379128-55-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c so that
they are colocated with similar functions rather than being split with
cifsfs.c.

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
 fs/smb/client/cifsfs.c | 55 ------------------------------------------
 fs/smb/client/cifsfs.h |  2 ++
 fs/smb/client/file.c   | 53 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index ebe04c78a955..1cd9309e46f7 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -981,61 +981,6 @@ cifs_smb3_do_mount(struct file_system_type *fs_type,
 	return root;
 }
 
-
-static ssize_t
-cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter)
-{
-	ssize_t rc;
-	struct inode *inode = file_inode(iocb->ki_filp);
-
-	if (iocb->ki_flags & IOCB_DIRECT)
-		return cifs_user_readv(iocb, iter);
-
-	rc = cifs_revalidate_mapping(inode);
-	if (rc)
-		return rc;
-
-	return generic_file_read_iter(iocb, iter);
-}
-
-static ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
-{
-	struct inode *inode = file_inode(iocb->ki_filp);
-	struct cifsInodeInfo *cinode = CIFS_I(inode);
-	ssize_t written;
-	int rc;
-
-	if (iocb->ki_filp->f_flags & O_DIRECT) {
-		written = cifs_user_writev(iocb, from);
-		if (written > 0 && CIFS_CACHE_READ(cinode)) {
-			cifs_zap_mapping(inode);
-			cifs_dbg(FYI,
-				 "Set no oplock for inode=%p after a write operation\n",
-				 inode);
-			cinode->oplock = 0;
-		}
-		return written;
-	}
-
-	written = cifs_get_writer(cinode);
-	if (written)
-		return written;
-
-	written = generic_file_write_iter(iocb, from);
-
-	if (CIFS_CACHE_WRITE(CIFS_I(inode)))
-		goto out;
-
-	rc = filemap_fdatawrite(inode->i_mapping);
-	if (rc)
-		cifs_dbg(FYI, "cifs_file_write_iter: %d rc on %p inode\n",
-			 rc, inode);
-
-out:
-	cifs_put_writer(cinode);
-	return written;
-}
-
 static loff_t cifs_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct cifsFileInfo *cfile = file->private_data;
diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
index 3adea10aa9da..28c41c449205 100644
--- a/fs/smb/client/cifsfs.h
+++ b/fs/smb/client/cifsfs.h
@@ -100,6 +100,8 @@ extern ssize_t cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to);
 extern ssize_t cifs_user_writev(struct kiocb *iocb, struct iov_iter *from);
 extern ssize_t cifs_direct_writev(struct kiocb *iocb, struct iov_iter *from);
 extern ssize_t cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from);
+ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from);
+ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 extern int cifs_flock(struct file *pfile, int cmd, struct file_lock *plock);
 extern int cifs_lock(struct file *, int, struct file_lock *);
 extern int cifs_fsync(struct file *, loff_t, loff_t, int);
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 255d78581e56..dfeb8cb86d61 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -4567,6 +4567,59 @@ ssize_t cifs_user_readv(struct kiocb *iocb, struct iov_iter *to)
 	return __cifs_readv(iocb, to, false);
 }
 
+ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	ssize_t rc;
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (iocb->ki_flags & IOCB_DIRECT)
+		return cifs_user_readv(iocb, iter);
+
+	rc = cifs_revalidate_mapping(inode);
+	if (rc)
+		return rc;
+
+	return generic_file_read_iter(iocb, iter);
+}
+
+ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct cifsInodeInfo *cinode = CIFS_I(inode);
+	ssize_t written;
+	int rc;
+
+	if (iocb->ki_filp->f_flags & O_DIRECT) {
+		written = cifs_user_writev(iocb, from);
+		if (written > 0 && CIFS_CACHE_READ(cinode)) {
+			cifs_zap_mapping(inode);
+			cifs_dbg(FYI,
+				 "Set no oplock for inode=%p after a write operation\n",
+				 inode);
+			cinode->oplock = 0;
+		}
+		return written;
+	}
+
+	written = cifs_get_writer(cinode);
+	if (written)
+		return written;
+
+	written = generic_file_write_iter(iocb, from);
+
+	if (CIFS_CACHE_WRITE(CIFS_I(inode)))
+		goto out;
+
+	rc = filemap_fdatawrite(inode->i_mapping);
+	if (rc)
+		cifs_dbg(FYI, "cifs_file_write_iter: %d rc on %p inode\n",
+			 rc, inode);
+
+out:
+	cifs_put_writer(cinode);
+	return written;
+}
+
 ssize_t
 cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to)
 {

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

