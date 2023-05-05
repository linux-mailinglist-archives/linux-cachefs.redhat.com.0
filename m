Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15194702A6B
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 May 2023 12:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684146330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ZAdTevy3pRrIjsURTs+eEt26qGBhcBvxHk7+63WSr4=;
	b=FlIIsotF9HjBc1n3FKyQslV719eP32XCQ1aDQp4ivFUYZLstR5/R9oLTEX++YcF8EtobKq
	Do/4Mn99SU/9CU56+vW5aCVZfdvs4U4MjOAh3ZovzSmF5nJnoKZOfQ35CNjWApyJOs1XC1
	/U3uI7RWnLNww1N6QD+Utq/1Ds/u8HE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-DiSCYwztNMyEK0XvPQGesA-1; Mon, 15 May 2023 06:25:28 -0400
X-MC-Unique: DiSCYwztNMyEK0XvPQGesA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0406185A790;
	Mon, 15 May 2023 10:25:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E71022026E1C;
	Mon, 15 May 2023 10:25:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC87519465B1;
	Mon, 15 May 2023 10:25:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14CC31946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  5 May 2023 08:32:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05B751121339; Fri,  5 May 2023 08:32:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F33F51121331
 for <linux-cachefs@redhat.com>; Fri,  5 May 2023 08:32:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0DC080080E
 for <linux-cachefs@redhat.com>; Fri,  5 May 2023 08:32:39 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-c08BMe--PNySQ_fGe0HIiQ-1; Fri, 05 May 2023 04:32:35 -0400
X-MC-Unique: c08BMe--PNySQ_fGe0HIiQ-1
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QCNgb2Bb0zsR53;
 Fri,  5 May 2023 16:11:39 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 16:13:26 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <dhowells@redhat.com>,
 <code@tyhicks.com>, <hirofumi@mail.parknet.co.jp>, <linkinjeon@kernel.org>,
 <sfrench@samba.org>, <senozhatsky@chromium.org>, <tom@talpey.com>,
 <chuck.lever@oracle.com>, <jlayton@kernel.org>, <miklos@szeredi.hu>,
 <paul@paul-moore.com>, <jmorris@namei.org>, <serge@hallyn.com>,
 <stephen.smalley.work@gmail.com>, <eparis@parisplace.org>,
 <casey@schaufler-ca.com>, <dchinner@redhat.com>,
 <john.johansen@canonical.com>, <mcgrof@kernel.org>, <mortonm@chromium.org>,
 <fred@cloudflare.com>, <mic@digikod.net>, <mpe@ellerman.id.au>,
 <nathanl@linux.ibm.com>, <gnoack3000@gmail.com>, <roberto.sassu@huawei.com>
Date: Fri, 5 May 2023 16:11:58 +0800
Message-ID: <20230505081200.254449-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 15 May 2023 10:25:24 +0000
Subject: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr() to
 take struct
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 wangweiyang2@huawei.com, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I am working on adding xattr/attr support for landlock [1], so we can
control fs accesses such as chmod, chown, uptimes, setxattr, etc.. inside
landlock sandbox. the LSM hooks as following are invoved:
1.inode_setattr
2.inode_setxattr
3.inode_removexattr
4.inode_set_acl
5.inode_remove_acl
which are controlled by LANDLOCK_ACCESS_FS_WRITE_METADATA.

and
1.inode_getattr
2.inode_get_acl
3.inode_getxattr
4.inode_listxattr
which are controlled by LANDLOCK_ACCESS_FS_READ_METADATA

Some of these hooks only take struct dentry as a argument, However, for
path-based LSMs such Landlock, Apparmor and Tomoyo, struct path instead
of struct dentry required to make sense of attr/xattr accesses. So we
need to refactor these hooks to take a struct path argument.

This patchset only refators inode_setattr hook as part of whole work.

Also, I have a problem about file_dentry() in __file_remove_privs() of the
first patch, before changes in commit c1892c37769cf ("vfs: fix deadlock in
file_remove_privs() on overlayfs"), it gets dentry and inode as belows:

struct dentry *dentry = file->f_path.dentry;
struct inode *inode = d_inode(dentry);

That would be clear to change it to pass &file->f_path to
__remove_privs()->notify_change()->inode_setattr().
After that commit, it has been changed to:

struct dentry *dentry = file_dentry(file);
struct inode *inode = file_inode(file);

If I understand correctly, the dentry from file_dentry() maybe the upper
or the lower, it can be different from file->f_path.dentry. It can't just
go back to use &file->f_path otherwise the bug will come back for
overlayfs. So for such scenario, how to get a path from file if the file
maybe or not from overlayfs, and which kind of overlayfs path is ok for
Landlock?

Xiu Jianfeng (2):
  fs: Change notify_change() to take struct path argument
  lsm: Change inode_setattr hook to take struct path argument

 drivers/base/devtmpfs.c       |  5 +++--
 fs/attr.c                     |  7 ++++---
 fs/cachefiles/interface.c     |  4 ++--
 fs/coredump.c                 |  2 +-
 fs/ecryptfs/inode.c           | 18 +++++++++---------
 fs/fat/file.c                 |  2 +-
 fs/inode.c                    |  8 +++++---
 fs/ksmbd/smb2pdu.c            |  6 +++---
 fs/ksmbd/smbacl.c             |  2 +-
 fs/namei.c                    |  2 +-
 fs/nfsd/vfs.c                 | 12 ++++++++----
 fs/open.c                     | 19 ++++++++++---------
 fs/overlayfs/overlayfs.h      |  4 +++-
 fs/utimes.c                   |  2 +-
 include/linux/fs.h            |  4 ++--
 include/linux/lsm_hook_defs.h |  2 +-
 include/linux/security.h      |  4 ++--
 security/security.c           | 10 +++++-----
 security/selinux/hooks.c      |  3 ++-
 security/smack/smack_lsm.c    |  5 +++--
 20 files changed, 67 insertions(+), 54 deletions(-)

-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

