Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EB703151
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 May 2023 17:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684163898;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4z3sbBmUWlr7vZAUX4cg6aQPPjqH5AN6yukrTN1pPCg=;
	b=MDhfLCwQ4IsOyeW9DAOYILjNg8JFrgHH36g+gSCFMUUAm1uhjdXfggpiGQM7LsaeN5MDRD
	blQdSewQlNuIPdD9Kpxf9VFgh6IgchHToAaQkRoV317EYGjh2yzMlb52ZLK3RMLXfDz2Su
	m3cGflI9WItUHhVmZ1vaeViVYXJHaCE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-q3TYf199OTWYEHj3D3Q-hw-1; Mon, 15 May 2023 11:18:16 -0400
X-MC-Unique: q3TYf199OTWYEHj3D3Q-hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2908D1C0513D;
	Mon, 15 May 2023 15:18:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B742A40C6EC4;
	Mon, 15 May 2023 15:18:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E04219465A3;
	Mon, 15 May 2023 15:18:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99FB6194658C for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 15 May 2023 15:18:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 379FA401DE04; Mon, 15 May 2023 15:18:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3039340C6EC4
 for <linux-cachefs@redhat.com>; Mon, 15 May 2023 15:18:11 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (unknown [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14BD385A588
 for <linux-cachefs@redhat.com>; Mon, 15 May 2023 15:18:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Oe1niP7iMKu56ZfvxtVbag-1; Mon, 15 May 2023 11:18:07 -0400
X-MC-Unique: Oe1niP7iMKu56ZfvxtVbag-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A3E7625DF;
 Mon, 15 May 2023 15:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA3FC433D2;
 Mon, 15 May 2023 15:12:28 +0000 (UTC)
Date: Mon, 15 May 2023 17:12:24 +0200
From: Christian Brauner <brauner@kernel.org>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Message-ID: <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230505081200.254449-1-xiujianfeng@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, linux-cifs@vger.kernel.org, paul@paul-moore.com,
 miklos@szeredi.hu, mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, selinux@vger.kernel.org,
 ecryptfs@vger.kernel.org, tom@talpey.com, linux-fsdevel@vger.kernel.org,
 wangweiyang2@huawei.com, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 mic@digikod.net, eparis@parisplace.org, hirofumi@mail.parknet.co.jp,
 gnoack3000@gmail.com, linux-nfs@vger.kernel.org, john.johansen@canonical.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, casey@schaufler-ca.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 05, 2023 at 04:11:58PM +0800, Xiu Jianfeng wrote:
> Hi,
> 
> I am working on adding xattr/attr support for landlock [1], so we can
> control fs accesses such as chmod, chown, uptimes, setxattr, etc.. inside
> landlock sandbox. the LSM hooks as following are invoved:
> 1.inode_setattr
> 2.inode_setxattr
> 3.inode_removexattr
> 4.inode_set_acl
> 5.inode_remove_acl
> which are controlled by LANDLOCK_ACCESS_FS_WRITE_METADATA.
> 
> and
> 1.inode_getattr
> 2.inode_get_acl
> 3.inode_getxattr
> 4.inode_listxattr
> which are controlled by LANDLOCK_ACCESS_FS_READ_METADATA

It would be helpful to get the complete, full picture.

Piecemeal extending vfs helpers with struct path arguments is costly,
will cause a lot of churn and will require a lot of review time from us.

Please give us the list of all security hooks to which you want to pass
a struct path (if there are more to come apart from the ones listed
here). Then please follow all callchains and identify the vfs helpers
that would need to be updated. Then please figure out where those
vfs helpers are called from and follow all callchains finding all
inode_operations that would have to be updated and passed a struct path
argument. So ultimately we'll end up with a list of vfs helpers and
inode_operations that would have to be changed.

I'm very reluctant to see anything merged without knowing _exactly_ what
you're getting us into.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

