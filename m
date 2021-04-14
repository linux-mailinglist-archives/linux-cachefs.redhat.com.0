Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E19835F3F1
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:38:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-DQv-NCgkOO-FRKsxVfTRXQ-1; Wed, 14 Apr 2021 08:38:53 -0400
X-MC-Unique: DQv-NCgkOO-FRKsxVfTRXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B788030C9;
	Wed, 14 Apr 2021 12:38:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B08755D6AC;
	Wed, 14 Apr 2021 12:38:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCDF9180B617;
	Wed, 14 Apr 2021 12:38:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECciH9018010 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:38:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56CB5E2053; Wed, 14 Apr 2021 12:38:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 514D1E30BD
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A8C10334A5
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-529-lFVq7gx2MkekIFIGkIXDRw-1;
	Wed, 14 Apr 2021 08:38:36 -0400
X-MC-Unique: lFVq7gx2MkekIFIGkIXDRw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id E73D461153;
	Wed, 14 Apr 2021 12:38:30 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:44 +0200
Message-Id: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECciH9018010
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 0/7] fs: tweak and switch more fses to
	private mounts
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

Hey,

Since [1] we support creating private mounts from a given path's
vfsmount. This makes them very suitable for any filesystem or
filesystem functionality that piggybacks on paths of another filesystem.
Overlayfs, cachefiles, and ecryptfs are three prime examples.

Since private mounts aren't attached in the filesystem they aren't
affected by mount property changes after the respective fs makes use of
them. This seems a rather desirable property as the underlying path
can't e.g. suddenly go from read-write to read-only and in general it
means that the fs is always in full control of the underlying mount
after the user has allowed it to be used (apart from operations that
affect the superblock of course).

Besides that it also makes things simpler for a variety of other vfs
features. One concrete example is fanotify. When the path->mnt of the
path that is used as a cache has been marked with FAN_MARK_MOUNT the
semantics get tricky as it isn't clear whether the watchers of path->mnt
should get notified about fsnotify events when files are created by
ecryptfs via path->mnt. Using a private mount lets us handle this case
too and aligns the behavior of stacks created by overlayfs.

Thanks!
Christian

[1]: c771d683a62e ("vfs: introduce clone_private_mount()")

Christian Brauner (7):
  namespace: fix clone_private_mount() kernel doc
  namespace: add kernel doc for mnt_clone_internal()
  namespace: move unbindable check out of clone_private_mount()
  cachefiles: switch to using a private mount
  cachefiles: extend ro check to private mount
  ecryptfs: switch to using a private mount
  ecryptfs: extend ro check to private mount

 fs/cachefiles/bind.c          | 41 +++++++++++++++++++++++++----------
 fs/ecryptfs/dentry.c          |  6 ++++-
 fs/ecryptfs/ecryptfs_kernel.h |  9 ++++++++
 fs/ecryptfs/inode.c           |  5 ++++-
 fs/ecryptfs/main.c            | 31 +++++++++++++++++++++-----
 fs/namespace.c                | 36 ++++++++++++++++++++++++------
 fs/overlayfs/super.c          | 13 +++++++++--
 7 files changed, 113 insertions(+), 28 deletions(-)


base-commit: e49d033bddf5b565044e2abe4241353959bc9120
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

