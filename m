Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D189A46D649
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Dec 2021 15:58:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585-9pYg12yoPF-iu5QWyDs0gw-1; Wed, 08 Dec 2021 09:58:49 -0500
X-MC-Unique: 9pYg12yoPF-iu5QWyDs0gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B736A100F942;
	Wed,  8 Dec 2021 14:58:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246A860843;
	Wed,  8 Dec 2021 14:58:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3D9F1809CB9;
	Wed,  8 Dec 2021 14:58:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8EjBgQ023420 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 09:45:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A616840CFD11; Wed,  8 Dec 2021 14:45:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A114E40CFD08
	for <linux-cachefs@redhat.com>; Wed,  8 Dec 2021 14:45:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8716F1064FAD
	for <linux-cachefs@redhat.com>; Wed,  8 Dec 2021 14:45:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-282-SK_fyrcMPp-xt_uomxrJ4g-1; Wed, 08 Dec 2021 09:45:10 -0500
X-MC-Unique: SK_fyrcMPp-xt_uomxrJ4g-1
Received: by mail-pg1-f170.google.com with SMTP id g16so2265752pgi.1;
	Wed, 08 Dec 2021 06:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zsky/SImT4uldRT10XDmxx67FpXPJPw2EiqrddSCfA4=;
	b=ZmqYBGb29oNuB8SetXdqz2M+KGeIXQD+Oxqai895kLUZaklqGC2UXpSRBGkqQXImrP
	BGq9sit8bq+BXRm05eB8bknvcoTBySll/ePxRgSGN/yuWMJW8wPMQoQmu5HUgN7/IhEg
	DGFL3gur2qFLq/pC5K7TO6h/VDakLNoL1XJVS4TO4OpYOA829PEmzpacijrLAXiBn3yZ
	rLN2jgbwEyffegKw8QbZORxPndcSz1o3x4+NFKztWHnli4hB00qWZBl2Xkcu18O3AxoD
	bPuSe30RLHgGTjFM2G1vzEWgNGS0m4WLZksDjN6QhCFhG2PdziyCi8UrsP8H8pE2thZm
	gLcg==
X-Gm-Message-State: AOAM5333jKd7sOHUmiI3mfs7iVlUUx0mUDvC7nZwAW/6W/FAGLNyqSg6
	66Zx13HGUFAKzsjwKg0rT4+jcBfu4Lbu6C2I45xbe+JDqVk=
X-Google-Smtp-Source: ABdhPJxc9cTDpHs08QVitQUMjgdgvv2YzEHQg7VXhoJnZm5HfFqj3S9MqMfDZ9Mcj5uBqJK725+RUAiLGePH+urT03Q=
X-Received: by 2002:a63:b50a:: with SMTP id y10mr26513587pge.596.1638974708424;
	Wed, 08 Dec 2021 06:45:08 -0800 (PST)
MIME-Version: 1.0
References: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
	<1355654.1638798741@warthog.procyon.org.uk>
In-Reply-To: <1355654.1638798741@warthog.procyon.org.uk>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Wed, 8 Dec 2021 20:14:56 +0530
Message-ID: <CANT5p=ogoa2ndAs5n5zzy4+NR-T6tyKmyB_1xQyqw6BTgBaXtw@mail.gmail.com>
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
Cc: Steve French <smfrench@gmail.com>, Paulo Alcantara <pc@cjr.nz>,
	linux-cachefs@redhat.com, CIFS <linux-cifs@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH] cifs: wait for tcon resource_id before
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 6, 2021 at 7:22 PM David Howells <dhowells@redhat.com> wrote:
>
> Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> > @@ -1376,6 +1376,13 @@ struct inode *cifs_root_iget(struct super_block *sb)
> >   inode = ERR_PTR(rc);
> >   }
> >
> > + /*
> > + * The cookie is initialized from volume info returned above.
> > + * Inside cifs_fscache_get_super_cookie it checks
> > + * that we do not get super cookie twice.
> > + */
> > + cifs_fscache_get_super_cookie(tcon);
>
> Ummm...  Does this handle the errors correctly?  What happens if rc != 0 at
> this point and the inode has been marked failed?  It looks like it will
> abandon creation of the superblock without cleaning up the super cookie.
> Maybe - or maybe it can't happen because of the:
>
>         iget_no_retry:
>                 if (!inode) {
>                         inode = ERR_PTR(rc);
>                         goto out;
>                 }
>
> check - but then why is rc being checked?
>
> > +
> >  out:
> >   kfree(path);
> >   free_xid(xid);
>
> David
>

Thanks David. I think that there still needs to be more error handling here.
I'll check on this and send out another patch.

-- 
Regards,
Shyam

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

