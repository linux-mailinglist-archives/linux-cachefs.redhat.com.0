Return-Path: <linux-cachefs+bncBCHIDX6I2QHBBME44SWQMGQEIEEH5OI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFB84274A
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Jan 2024 15:56:49 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42a1ca15f88sf72623891cf.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Jan 2024 06:56:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706626608; cv=pass;
        d=google.com; s=arc-20160816;
        b=oipYHpV5jn6Sz0bFeSexMu3L23WH6HIvaAN0Yn4UGXyQ4BlvN8a6Hn58zVxxjy3UzQ
         ATQYiQAzKU4tV+ZIYbiKtsJqhKUhtI9nSYHJKxCAruaKEv5cq/ezcOCKQvv/rH9SRJef
         4RY9nYuW+b3JxJp2svM4wJkS3sAYf8uDelO4QNh/bHGc1AtsmOXDVuFRE3bMro1HPVsg
         ebJFLDBk60YhAaY0QrnPSPjfYS75mdbtpOvg4Ct+Nw4uCScJ5h/svJKrn54eMyBenpDP
         IwxVzdwnqRLNnu+cIWXb17LXVCKnojpIQ6pTgyn3llIJIn81XCJT5J/VFMTbrNAsbuEr
         v0gA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :delivered-to;
        bh=Re3PGdsnNUus2iRP9Lk3dSUFKOHd0fcijrr7es56niM=;
        fh=sBrm5oz3BdrHc7J83Ac4gd1YkPAOokPLoc0s5OcMUcg=;
        b=F7DMfDMvgU3Z1klWM7mMW87UFauouKaLiAY8ZylBbm051LAQLXxaM9k5PLy5i4IQ5l
         4TiDsuyxHNIMFdOTQIXLnrU4GWt5Mi4VEKueO+5kYVhhC1QQHDAEjSKXIoH39+o2x9Mp
         Kqp1XXPX9RONFNzhSu12G/iru4nQ1laqpBngYxlTiTv2TnHsEPXcAihzseqQqXx89HKG
         UjAxWE07PxMX4nYFGOiQ9TIbdZYGZjTx5jfELSLdaa00yQjI+KWNrL0nOO0T1WJpk0Sg
         SaF6A8Q+XntYqmpPIpiOKRdE8IeRVnDvO4A/FRe2Abxaj7YX9QXjwwy6dHa7CXlswirq
         wfxA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of dwysocha@redhat.com designates 209.85.215.198 as permitted sender) smtp.mailfrom=dwysocha@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626608; x=1707231408;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Re3PGdsnNUus2iRP9Lk3dSUFKOHd0fcijrr7es56niM=;
        b=sAfm6pVA1lRId/+ObDQQhpBKyWJCtmcoMRBRVCqCJy4G4Ip5CR6gRowBoKVLXRvieM
         GA3jrBFu7mfjo1c4pL2RGBruTxhQyCuqYPXNLrZtaTdnuOpgZSNjwdKEWlAjAudZu+ry
         gfaO9kFVKJdSyfJagLQOMB/8ZZjqhXjs4U4dkuCzwu75Tw3WkeznRARHjp2fsSfIYcfd
         om7M47hwfBmUlojAhWXjm8H1GEHLo8KemDZSFnrW26m5XrCMdvHdE0P8bbzwVbR5a7v5
         RIQrSsDdvEowMJxUzxViEBgJDvkOFXt+sYDXDtIJuf0UNZt0tk5JbZw4fiqFvMdeTVEb
         do8A==
X-Gm-Message-State: AOJu0Yye9ZIbxBcMSY2XmUUjgV2JM0xvfRZKSnjDgs0nRLOGbf/sQl/L
	EY0cMsxJnABKgtUr/uUy4wjG3qqjKwnUM/7EYmI61XgBo5HlQ0s0FIAvhhuauIQ=
X-Google-Smtp-Source: AGHT+IE0Nb4Vb/BzSjGZ7ZDY3KuYJyUZfi1gDgZkIKmnjKkfW15q/VnXZuwXh2J1w5Um9YeqS0QZHQ==
X-Received: by 2002:a05:622a:164d:b0:42a:3dfc:5f26 with SMTP id y13-20020a05622a164d00b0042a3dfc5f26mr8638834qtj.124.1706626608431;
        Tue, 30 Jan 2024 06:56:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a03:b0:42a:97f6:db7c with SMTP id
 f3-20020a05622a1a0300b0042a97f6db7cls2812419qtb.1.-pod-prod-01-us; Tue, 30
 Jan 2024 06:56:47 -0800 (PST)
X-Received: by 2002:a67:fa5a:0:b0:46b:1777:618b with SMTP id j26-20020a67fa5a000000b0046b1777618bmr4348935vsq.36.1706626607532;
        Tue, 30 Jan 2024 06:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706626607; cv=none;
        d=google.com; s=arc-20160816;
        b=0DMfAwg2LDg5GZ7dZVGQjYjRLZQR+L3MwdIx2qHFLeowuavBj07SoK42syd8AGzLHU
         mhy/6dAt1Fyq7hW38Px+tPvUOCgnAm54gAZlKgDQUNzTYFm/TioWMIkapbk+0r9AhgiN
         NT+G/Bjj2S9zyHrV8nCw0rEicz3VqvEBArAuyqSaTebJDqljAKMEsFnMsz6RU5WUhs6d
         QUvgDdni1zHL1cxKuy9180RzVnt+bCqTyyZUqPXvqGj9ukk6w+OO5mctDnb7uyBq8m22
         LMxWj5IeDExfjXNR57KPswRoNj6U9lD5fdGGNEBjCNGypf2RWJ2f4CgEc2nTfxs/8D0N
         ja8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to;
        bh=Wn4PZs8Fk0K6IydkmaSZCojqBYBcqOWooJgGoP6pp/M=;
        fh=sBrm5oz3BdrHc7J83Ac4gd1YkPAOokPLoc0s5OcMUcg=;
        b=kUFnYL2+j74l12o7Svc1RUQTFyebBqAv/WJ+d43rW6WZ9//V0EJ1cIqUPX9Cd6OVbK
         ipOj7VYGppcsnra0sJ9xiSnA5IZaKZ2DOVXsVtHnK3r3ED8VrRnzOe0tw4YJOGbIjE/+
         UWstulag1SML62coOoRJ8nlX9UjnDE4xe+eeIPWBUvKExPsBr5wFezKNzSZ2PQPmh/TQ
         E4/9oQI86fL4VsjkFhrVJLgC12p8J7qraDVOKV7zV1Mf1skKHDjbyCSHFZ82AXoSaePf
         zVa+/ZKkYtQaTVh9w7JgDPmhx0Z4TFixLQMLO6U0s1aIowAEzVfS0WloaIgom6TYOS/Q
         yYRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dwysocha@redhat.com designates 209.85.215.198 as permitted sender) smtp.mailfrom=dwysocha@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id a4-20020ac85b84000000b0042aa8322bd1si4002074qta.245.2024.01.30.06.56.47
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 06:56:47 -0800 (PST)
Received-SPF: pass (google.com: domain of dwysocha@redhat.com designates 209.85.215.198 as permitted sender) client-ip=209.85.215.198;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-_pavwAODMfi2qhT7MhNMiw-1; Tue, 30 Jan 2024 09:56:46 -0500
X-MC-Unique: _pavwAODMfi2qhT7MhNMiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0EEA8350E4
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Jan 2024 14:56:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DDB901C060B1; Tue, 30 Jan 2024 14:56:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D64741C060B3
	for <linux-cachefs@redhat.com>; Tue, 30 Jan 2024 14:56:45 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B55D81C0513D
	for <linux-cachefs@redhat.com>; Tue, 30 Jan 2024 14:56:45 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-lfyQoTy4PZyRG3NMEd6sNw-1; Tue, 30 Jan 2024 09:56:44 -0500
X-MC-Unique: lfyQoTy4PZyRG3NMEd6sNw-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5ce97b87716so2062093a12.0
        for <linux-cachefs@redhat.com>; Tue, 30 Jan 2024 06:56:44 -0800 (PST)
X-Received: by 2002:a05:6a20:bc89:b0:199:cecf:9f5d with SMTP id fx9-20020a056a20bc8900b00199cecf9f5dmr4286283pzb.29.1706626603247;
        Tue, 30 Jan 2024 06:56:43 -0800 (PST)
X-Received: by 2002:a05:6a20:bc89:b0:199:cecf:9f5d with SMTP id
 fx9-20020a056a20bc8900b00199cecf9f5dmr4286275pzb.29.1706626602978; Tue, 30
 Jan 2024 06:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20240129154750.1245317-1-dwysocha@redhat.com> <1526807.1706548521@warthog.procyon.org.uk>
 <CALF+zOm9QBkf3PbchuVzkgYW1aEJWFFQ5JF0Y-_6BbPJke8CHw@mail.gmail.com> <dd504acbdfb0b926e54318fd6ea8f9d43af73634.camel@kernel.org>
In-Reply-To: <dd504acbdfb0b926e54318fd6ea8f9d43af73634.camel@kernel.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 30 Jan 2024 09:56:06 -0500
Message-ID: <CALF+zOnR1Hu-M=N7+ALcNicbVvEO=G5XN0roigxps15Wj0O8uA@mail.gmail.com>
Subject: Re: [PATCH] NFS: Fix nfs_netfs_issue_read() xarray locking for
 writeback interrupt
To: Jeff Layton <jlayton@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Anna Schumaker <anna.schumaker@netapp.com>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org, 
	linux-cachefs@redhat.com
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: dwysocha@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of dwysocha@redhat.com designates 209.85.215.198 as permitted sender) smtp.mailfrom=dwysocha@redhat.com
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

On Mon, Jan 29, 2024 at 12:44=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Mon, 2024-01-29 at 12:34 -0500, David Wysochanski wrote:
> > On Mon, Jan 29, 2024 at 12:15=E2=80=AFPM David Howells <dhowells@redhat=
.com> wrote:
> > >
> > > Dave Wysochanski <dwysocha@redhat.com> wrote:
> > >
> > > > -     xas_lock(&xas);
> > > > +     xas_lock_irqsave(&xas, flags);
> > > >       xas_for_each(&xas, page, last) {
> > >
> > > You probably want to use RCU, not xas_lock().  The pages are locked a=
nd so
> > > cannot be evicted from the xarray.
> > >
> >
> > I tried RCU originally and ran into a problem because NFS can schedule
> > (see comment on line 328 below)
> >
> > 326         xas_lock_irqsave(&xas, flags);
> > 327         xas_for_each(&xas, page, last) {
> > 328                 /* nfs_read_add_folio() may schedule() due to pNFS
> > layout and other RPCs  */
> > 329                 xas_pause(&xas);
> > 330                 xas_unlock_irqrestore(&xas, flags);
> > 331                 err =3D nfs_read_add_folio(&pgio, ctx, page_folio(p=
age));
> > 332                 if (err < 0) {
> > 333                         netfs->error =3D err;
> > 334                         goto out;
> > 335                 }
> > 336                 xas_lock_irqsave(&xas, flags);
> > 337         }
> > 338         xas_unlock_irqrestore(&xas, flags);
> >
>
> Looking at it more closely, I think you might want to just use
> xa_for_each_start(). That will do the traversal using the rcu_read_lock
> under the hood, and you should be able to block on every iteration.
>
Thanks Jeff.  Yes, I agree after looking at this further, this is a
good approach, and much cleaner.  I'll work on a v2 patch (actually
with xa_for_each_range as you suggested off list) and send after
a bit of testing -- so far, so good.

FWIW, my original usage of RCU was outside the whole loop.
I ran into problems due to nfs_read_add_folio().

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

