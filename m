Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930C4A4C08
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 17:28:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ydIxcyFAMOKULWVWUPF-KQ-1; Mon, 31 Jan 2022 11:28:54 -0500
X-MC-Unique: ydIxcyFAMOKULWVWUPF-KQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8C79835B50;
	Mon, 31 Jan 2022 16:28:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 603CA753C0;
	Mon, 31 Jan 2022 16:28:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E68E61809CB8;
	Mon, 31 Jan 2022 16:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VGSoeq012702 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 11:28:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F35740CFD1D; Mon, 31 Jan 2022 16:28:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B27240CFD0F
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 16:28:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 134843821BE9
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 16:28:50 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-648-hAL5MRlwOuG0i3hRcuqE5Q-1; Mon, 31 Jan 2022 11:28:46 -0500
X-MC-Unique: hAL5MRlwOuG0i3hRcuqE5Q-1
Received: by mail-io1-f41.google.com with SMTP id q204so17580901iod.8;
	Mon, 31 Jan 2022 08:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FWHxzL6ukBtNWpYV3M+KSic9V4wnJNgq8ieHpEwO93o=;
	b=Zqok/vVwk16n+YP7YV1WABEjvJc/+yVMbWV0s7bsxHo5+Yftsjxpy6EOxMm7abSE4W
	hmf0t+AwDsSLNhTeQwKNbhL3tq09DIZl32ARH0/vkG48zSRCa/UrgeHrMubfqQNdjUZC
	zTBuLnfRobUS6CmMzARFNgVITsK5Fereum4/lnk40yGplL3yAINETtHJpHF7V6q6C4DM
	mPxDCth2wO+dlMe7fZME78VLcEG8JXMGCn+drJd5CltG7cuU+32bcVx4v3O3lqmt/Nq4
	2yw5hwC9PAgdKNvM91iGrdIDS24Xx/66u7/eS4OFw6+FUPzbAkGXTeGhPUSYfulahGiY
	nCSg==
X-Gm-Message-State: AOAM532sQu21UTGkhLvtnFQBDsABdB8KYfbZpJpgP4o2fZBNpNCG0Ud3
	TcJLZ3OM+DHFMpNjGmN+gHNLVDDJk5eU04zTg+HkHt0y6nw=
X-Google-Smtp-Source: ABdhPJxNb3/z0NjiVlXTcilGZskFbZSPKskFhMTsV47EDfmw8oXlq6P8d86Mev/eeZ6FGVTUKhcSVzplXAu06yRfSts=
X-Received: by 2002:a02:b0c3:: with SMTP id w3mr11342820jah.1.1643646525134;
	Mon, 31 Jan 2022 08:28:45 -0800 (PST)
MIME-Version: 1.0
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
In-Reply-To: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 18:28:34 +0200
Message-ID: <CAOQ4uxgyfQULxH_ot5eAH1V7uAi4FVn5V4aKEHyJtWvnw0SODQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [RFC][PATCH 0/5] vfs, overlayfs,
 cachefiles: Combine I_OVL_INUSE and S_KERNEL_FILE and split out
 no-remove
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

On Mon, Jan 31, 2022 at 5:12 PM David Howells <dhowells@redhat.com> wrote:
>
>
> Hi Amir,
>
> How about this as a set of patches to do what you suggest[1] and hoist the
> handler functions for I_OVL_INUSE into common code and rename the flag to
> I_EXCL_INUSE.  This can then be shared with cachefiles - allowing me to get
> rid of S_KERNEL_FILE.
>

They look like what I had in mind.
Unfortunately, I had forgotten about another use that ovl makes of the flag
(see comment on patch 1/5). I'd made a suggestion on how to get rid of that use
case, but I hope this won't complicate things too much for you.

> I did split out the functionality for preventing file/dir removal to a
> separate flag, I_NO_REMOVE, so that it's not tied to I_EXCL_INUSE in case
> overlayfs doesn't want to use it.  The downside to that, though is that it
> requires a separate locking of i_lock to set/clear it.
>
> I also added four general tracepoints to log successful lock/unlock,
> failure to lock and a bad unlock.  The lock tracepoints log which driver
> asked for the lock and all tracepoints allow the driver to log an arbitrary
> reference number (in cachefiles's case this is the object debug ID).
>
> Questions:
>
>  (1) Should it be using a flag in i_state or a flag in i_flags?  I'm not
>      sure what the difference is really.

Me neither.

>
>  (2) Do we really need to take i_lock when testing I_EXCL_INUSE?  Would
>      READ_ONCE() suffice?
>

For ovl_is_inuse() I think READ_ONCE() should suffice.

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

