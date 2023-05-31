Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0F717AC3
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 May 2023 10:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685523280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CD0iVxqPK2WRUAtdgcsouko9MLiCkdA6HKcd3iSZ1kk=;
	b=KPqxftXIxG4Arj4kZHMaWEsQKbmGK2moXqeKSnyckYcYAdsXLarmWAfkxBjeZa2AvGFJTr
	UR0RHzc/2Dev8vZrWC/m30mLy4EwDHaEsnqGq9ccRBaqJCvcljJPK+t8diNsxfaiSdl99B
	q66W3mESkfzBF0c9fRT07+IVoK6+isE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-7VEGbq05PeG39MhpoklMUA-1; Wed, 31 May 2023 04:54:37 -0400
X-MC-Unique: 7VEGbq05PeG39MhpoklMUA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DEEB3C11C73;
	Wed, 31 May 2023 08:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41E7B492B00;
	Wed, 31 May 2023 08:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0AFEE19465A8;
	Wed, 31 May 2023 08:54:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7B7819465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 May 2023 08:36:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C228F40D1B60; Wed, 31 May 2023 08:36:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA50340C6EC4
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 08:36:29 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64FC38007D9
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 08:36:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-RZWxpWaQNGav7J2tlIIGuQ-1; Wed, 31 May 2023 04:36:25 -0400
X-MC-Unique: RZWxpWaQNGav7J2tlIIGuQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3B1C62E4C;
 Wed, 31 May 2023 08:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE0BC433D2;
 Wed, 31 May 2023 08:36:14 +0000 (UTC)
Date: Wed, 31 May 2023 10:36:11 +0200
From: Christian Brauner <brauner@kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <20230531-endpreis-gepflanzt-80a5a4a9c8d6@brauner>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
 <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
 <20230530-tumult-adrenalin-8d48cb35d506@brauner>
 <28f3ca55-29ea-4582-655d-2769881127ad@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <28f3ca55-29ea-4582-655d-2769881127ad@schaufler-ca.com>
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
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-cifs@vger.kernel.org, paul@paul-moore.com, miklos@szeredi.hu,
 mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 wangweiyang2@huawei.com, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 03:15:01PM -0700, Casey Schaufler wrote:
> On 5/30/2023 9:01 AM, Christian Brauner wrote:
> > On Tue, May 30, 2023 at 07:55:17AM -0700, Casey Schaufler wrote:
> >> On 5/30/2023 7:28 AM, Christoph Hellwig wrote:
> >>> On Tue, May 30, 2023 at 03:58:35PM +0200, Christian Brauner wrote:
> >>>> The main concern which was expressed on other patchsets before is that
> >>>> modifying inode operations to take struct path is not the way to go.
> >>>> Passing struct path into individual filesystems is a clear layering
> >>>> violation for most inode operations, sometimes downright not feasible,
> >>>> and in general exposing struct vfsmount to filesystems is a hard no. At
> >>>> least as far as I'm concerned.
> >>> Agreed.  Passing struct path into random places is not how the VFS works.
> >>>
> >>>> So the best way to achieve the landlock goal might be to add new hooks
> >>> What is "the landlock goal", and why does it matter?
> >>>
> >>>> or not. And we keep adding new LSMs without deprecating older ones (A
> >>>> problem we also face in the fs layer.) and then they sit around but
> >>>> still need to be taken into account when doing changes.
> >>> Yes, I'm really worried about th amount of LSMs we have, and the weird
> >>> things they do.
> >> Which LSM(s) do you think ought to be deprecated? I only see one that I
> > I don't have a good insight into what LSMs are actively used or are
> > effectively unused but I would be curious to hear what LSMs are
> > considered actively used/maintained from the LSM maintainer's
> > perspective.
> 
> I'm not the LSM maintainer, but I've been working on the infrastructure
> for quite some time. All the existing LSMs save one can readily be associated
> with active systems, and the one that isn't is actively maintained. We have
> not gotten into the habit of accepting LSMs upstream that don't have a real
> world use.
> 
> >> might consider a candidate. As for weird behavior, that's what LSMs are
> >> for, and the really weird ones proposed (e.g. pathname character set limitations)
> > If this is effectively saying that LSMs are licensed to step outside the
> > rules of the subsystem they're a guest in then it seems unlikely
> > subsystems will be very excited to let new LSM changes go in important
> > codepaths going forward. In fact this seems like a good argument against
> > it.
> 
> This is an artifact of Linus' decision that security models should be
> supported as add-on modules. On the one hand, all that a subsystem maintainer
> needs to know about a security feature is what it needs in the way of hooks.
> On the other hand, the subsystem maintainer loses control over what kinds of
> things the security feature does with the available information. It's a
> tension that we've had to deal with since the Orange Book days of the late
> 1980's. The deal has always been:
> 
> 	You can have your security feature if:
> 	1. If I turn it off it has no performance impact
> 	2. I don't have to do anything to maintain it
> 	3. It doesn't interfere with any other system behavior
> 	4. You'll leave me alone
> 
> As a security developer from way back I would be delighted if maintainers of
> other subsystems took an active interest in some of what we've been trying
> to accomplish in the security space. If the VFS maintainers would like to
> see the LSM interfaces for file systems changed I, for one, would like very
> much to hear about what they'd prefer. 

What is important for us is that the security layer must understand and
accept that some things cannot be done the way it envisions them to be
done because it would involve design compromises in the fs layer that
the fs maintainers are unwilling to make. The idea to pass struct path
to almost every security hook is a good example.

If the project is feature parity between inode and path based LSMs then
it must be clear from the start that this won't be achieved at the cost
of mixing up the layer where only dentries and inodes are relevant and
the layer where struct paths are most relevant.

> 
> We do a lot of crazy things to avoid interfering with the subsystems we
> interact with. A closer developer relationship would be most welcome, so
> long as it helps us achieve or goals. We get a lot of complaints about how
> LSM feature perform, but no one wants to hear that a good deal of that comes
> about because of what has to be done in support of 1, 2 and 3 above. Sometimes
> we do stoopid things, but usually it's to avoid changes "outside our swim lane".

I personally am not opposed to comment on patches but they will
naturally have lower priority than other things.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

