Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50144355066
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 11:58:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-xkYVudGWNTulIBVc3IbRJw-1; Tue, 06 Apr 2021 05:58:20 -0400
X-MC-Unique: xkYVudGWNTulIBVc3IbRJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3051F100CD0E;
	Tue,  6 Apr 2021 09:58:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B995710016DB;
	Tue,  6 Apr 2021 09:58:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47C3C4BB7B;
	Tue,  6 Apr 2021 09:58:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1369w7s3018558 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 05:58:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B48FF2D44E; Tue,  6 Apr 2021 09:58:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A97196379F
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 09:58:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E57A185A7A5
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 09:58:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-244-Pg63Do44NUeoDhvXt0K1Zg-1;
	Tue, 06 Apr 2021 05:58:03 -0400
X-MC-Unique: Pg63Do44NUeoDhvXt0K1Zg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01E0F61074;
	Tue,  6 Apr 2021 09:49:37 +0000 (UTC)
Date: Tue, 6 Apr 2021 11:49:35 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210406094935.wg3wrctebqs466hz@wittgenstein>
References: <20210405164603.281189-1-brauner@kernel.org>
	<107463.1617700345@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <107463.1617700345@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	linux-cachefs@redhat.com, Amir Goldstein <amir73il@gmail.com>
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: use private mounts in
	cache->mnt
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 06, 2021 at 10:12:25AM +0100, David Howells wrote:
> Christian Brauner <brauner@kernel.org> wrote:
> 
> > Besides that - and probably irrelevant from the perspective of a
> > cachefiles developer - it also makes things simpler for a variety of
> > other vfs features. One concrete example is fanotify.
> 
> What about cachefilesd?  That walks over the tree regularly, stats things and
> maybe deletes things.  Should that be in a private mount/namespace too?

You mean running the userspace cachefilesd daemon in a separate mount
namespace? I think that would make a lot of sense. Either the daemon
could manage a separate private mount namespace itself or if you support
systemd service files you could set:

PrivateMounts=yes

in the service file which:

"Takes a boolean parameter. If set, the processes of this unit will be
run in their own private file system (mount) namespace with all mount
propagation from the processes towards the host's main file system
namespace turned off. This means any file system mount points
established or removed by the unit's processes will be private to them
and not be visible to the host."

(Fwiw, Debian still ships /etc/init.d/cachefilesd which seems a bit
antique imho.)

> 
> > This seems a rather desirable property as the underlying path can't e.g.
> > suddenly go from read-write to read-only and in general it means that
> > cachefiles is always in full control of the underlying mount after the
> > user has allowed it to be used as a cache.
> 
> That's not entirely true, but I guess that emergency R/O conversion isn't a
> case that's worrisome - and, in any case, only affects the superblock.
> 
> >  	ret = -EINVAL;
> > -	if (mnt_user_ns(path.mnt) != &init_user_ns) {
> > +	if (mnt_user_ns(cache->mnt) != &init_user_ns) {
> >  		pr_warn("File cache on idmapped mounts not supported");
> >  		goto error_unsupported;
> >  	}
> 
> Is it worth doing this check before calling clone_private_mount()?

Yes, it's safe to do that. It's just my paranoia that made me write it
this way. In order to create an idmapped mount
real_mount(&path->mnt)->mnt_ns->seq must be 0, i.e. an anonymous mount
which can't be found through the fileystem. So in order for path->mnt to
be idmapped it must be already attached to the fileystem and we don't
allow mnt_userns to change (for good reasons).

> 
> > +	cache_path = path;
> > +	cache_path.mnt = cache->mnt;
> 
> Seems pointless to copy all of path into cache_path rather than just
> path.dentry.

Sure, will change to:

cache_path.dentry = path.dentry;
cache_path.mnt = cache->mnt;

Christian

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

