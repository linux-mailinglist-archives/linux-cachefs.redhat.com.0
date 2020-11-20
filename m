Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 659CB2BAD56
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605885593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H5PT0xoyXTdXCTuzXDVpvUdl9DIXUfupOVo3PSO7+5A=;
	b=ci8/FXexmlFYcAE4FvDYSuK3fIBi6eTErv7fgzS5tm/vDLAbWa0gB6Emthq89Bo065njD2
	k+7ohJuut7dRXMLBqrTFj2OMrpGhk6TaVTGF2dejOovWwNkTVVAreYfz+BFkvYUd3U8To0
	Vy4Qiwu+m+5o3GOPvmyyr15CnuxoV4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-Ol-j9tFCPeS9aHHBBHuZzQ-1; Fri, 20 Nov 2020 10:19:51 -0500
X-MC-Unique: Ol-j9tFCPeS9aHHBBHuZzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 413B18144E1;
	Fri, 20 Nov 2020 15:19:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FCA45D9D5;
	Fri, 20 Nov 2020 15:19:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16D444EEEE;
	Fri, 20 Nov 2020 15:19:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFJloM015809 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:19:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 288E75D6D1; Fri, 20 Nov 2020 15:19:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E5B95D6AD;
	Fri, 20 Nov 2020 15:19:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:19:43 +0000
Message-ID: <160588558350.3465195.13840089242353769411.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 76/76] afs: Fix speculative status fetch
 going out of order wrt to modifications
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

When doing a lookup in a directory, the afs filesystem uses a bulk status
fetch to speculatively retrieve the statuses of up to 48 other vnodes found
in the same directory and it will then either update extant inodes or
create new ones - effectively doing 'lookup ahead'.

To avoid the possibility of deadlocking itself, however, the filesystem
doesn't lock all of those inodes; rather just the directory inode is locked
(by the VFS).  When the operation completes, afs_inode_init_from_status()
or afs_apply_status() is called, depending on whether the inode already
exists, to commit the new status.

A case exists, however, where the speculative status fetch operation may
straddle a modification operation on one of those vnodes.  What can then
happen is that the speculative bulk status RPC retrieves the old status,
and whilst that is happening, the modification happens - which returns an
updated status, then the modification status is committed, then we attempt
to commit the speculative status.

This results in something like the following being seen in dmesg:

	kAFS: vnode modified {100058:861} 8->9 YFS.InlineBulkStatus

showing that for vnode 861 on volume 100058, we saw YFS.InlineBulkStatus
say that the vnode had data version 8 when we'd already recorded version 9
due to a local modification.  This was causing the cache to be invalidated
for that vnode when it shouldn't have been.  If it happens on a data file,
this might lead to local changes being lost.

Fix this by ignoring speculative status updates if the data version doesn't
match the expected value.

Note that it is possible to get a DV regression if a volume gets restored
from a backup - but we should get a callback break in such a case that
should trigger a recheck anyway.  It might be worth checking the volume
creation time in the volsync info and, if a change is observed in that (as
would happen on a restore), invalidate all caches associated with the
volume.

Fixes: 5cf9dd55a0ec ("afs: Prospectively look up extra files when doing a single lookup")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c      |    1 +
 fs/afs/inode.c    |    8 ++++++++
 fs/afs/internal.h |    1 +
 3 files changed, 10 insertions(+)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 26ac5cfdf3af..157529b0e422 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -900,6 +900,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 				vp->cb_break_before = afs_calc_vnode_cb_break(vnode);
 				vp->vnode = vnode;
 				vp->put_vnode = true;
+				vp->speculative = true; /* vnode not locked */
 			}
 		}
 	}
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 9d8f759f77f7..acb47a862893 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -295,6 +295,13 @@ void afs_vnode_commit_status(struct afs_operation *op, struct afs_vnode_param *v
 			op->flags &= ~AFS_OPERATION_DIR_CONFLICT;
 		}
 	} else if (vp->scb.have_status) {
+		if (vp->dv_before + vp->dv_delta != vp->scb.status.data_version &&
+		    vp->speculative)
+			/* Ignore the result of a speculative bulk status fetch
+			 * if it splits around a modification op, thereby
+			 * appearing to regress the data version.
+			 */
+			goto out;
 		afs_apply_status(op, vp);
 		if (vp->scb.have_cb)
 			afs_apply_callback(op, vp);
@@ -306,6 +313,7 @@ void afs_vnode_commit_status(struct afs_operation *op, struct afs_vnode_param *v
 		}
 	}
 
+out:
 	write_sequnlock(&vnode->cb_lock);
 
 	if (vp->scb.have_status)
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index e80fb6fe15b3..07471deeb6a8 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -760,6 +760,7 @@ struct afs_vnode_param {
 	bool			update_ctime:1;	/* Need to update the ctime */
 	bool			set_size:1;	/* Must update i_size */
 	bool			op_unlinked:1;	/* True if file was unlinked by op */
+	bool			speculative:1;	/* T if speculative status fetch (no vnode lock) */
 };
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

