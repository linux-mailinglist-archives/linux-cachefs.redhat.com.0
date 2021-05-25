Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C1494390C6B
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 May 2021 00:48:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-v9F82qntO6mHtlGblp6c2Q-1; Tue, 25 May 2021 18:48:18 -0400
X-MC-Unique: v9F82qntO6mHtlGblp6c2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7E6801B12;
	Tue, 25 May 2021 22:48:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A68860CEC;
	Tue, 25 May 2021 22:48:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2D1555345;
	Tue, 25 May 2021 22:48:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PMmBfN010101 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 18:48:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEE8F2087473; Tue, 25 May 2021 22:48:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B97CB208747E
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 22:48:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E596C800B26
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 22:48:08 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1621982888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=YlPbqM+DeU+TeUaw/+I46ysn1Xt6YY6jDH4OYyKVEvw=;
	b=RUICEqYhBRvc1jvqMJgpIvkkRgr+61WUDDC/e6XZG3lgZYOh6S9bcqd0MgMhnPBp9f5t8Z
	Y/k4pwg4czyLpZBcfFMW8DqT6UBUiGctwT7GM93Y6wy3zSHUtlbfg4d5H57e1tXs/ruspz
	tVGKZ+w5qNzzkN8W1d8aACmtjaDK5FQiAVBCXZg0DkfkCGXP9hR9aBFtCCBYJk/e/+x8hK
	ReGH8n9JM/fhOhlKqZTVfopC19BdgZYucsotc2V79KB0gqd1kzgjunQN73D+zL2SZPalVL
	ZHgdCt9u34uBb6a8oLkIO/wiGTZtGLPPnR8z/EkwaYaDX6uxBooOOrryqBqi+A==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1621982888; a=rsa-sha256;
	cv=none;
	b=MzSMSpqkA+52DAD0H2w8JwJxiKlCy7/OT0Wc2N37KySdPSkawLGOnGDJHVrhoFvsX2nAdS
	DUjBZt/hQIZeByNNKAVCv53biGwNBjCRofCP427ND9yqabTCWMcWvcGrHhFXspe7rVnLzo
	vj59qe1JUJAb+SFuf0mR1Ozq2DIE3A6YgS+RVNNlCKV9MbX+4ewocroQo0YNVU9PnSawAv
	a7sY9oOwV66dtTX2Y1tj4xJ4LG0r8XEvRdszBAkaMckqAt9ZKllendAt1vnx7Fl+xRPPsD
	FFBcGbmoLc0sRm2aThjXiTCT2aa7w4tfUhH1v7mKxXohxywyxp/IAHb/2hkcPw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=HMjd6r8W; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.210.175 as permitted sender)
	smtp.mailfrom=adilger@dilger.ca
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-499-G2hdAzJoOJauQJr2ic6WGg-1; Tue, 25 May 2021 18:48:05 -0400
X-MC-Unique: G2hdAzJoOJauQJr2ic6WGg-1
Received: by mail-pf1-f175.google.com with SMTP id d16so24743710pfn.12
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dilger-ca.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=lQU/mw2gew9Xsu/0BklV7sCPI0gkzm5yQeyxIIbvBKw=;
	b=HMjd6r8WAvXPNaQI4bYAP8fKI8dQWuW89LsVrprrgTOuU5+BFUxRmFqVp3hgOAxagR
	cfNBC4uv3kNMsqzqoimFA4P0hBzrScP7tZDugDdtQRaMCIsp83d7eP4aRFgdjTOAkqaY
	EcBySS5OB1Jp1RM9rOIeg4vGNuAodjB8ioNpZliXG5YHvgOI5vg6YkAsh8UlVfEUorgi
	tooZ04Fa4XmOI54vufP3tUNGpQ/vItEuv5AaKv2Kz04lqJiQQJioKi7vXh+7NeFtpPl8
	PrkJ7Fh3n+1xNy+RRz0AlWzBWRZxgnKN90n8tN2vGcjphifpsmzNuElKDbcfnWwdUmZI
	T4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=lQU/mw2gew9Xsu/0BklV7sCPI0gkzm5yQeyxIIbvBKw=;
	b=uEIa7RX+J+B7EwHQZF0IBzqQTcwj+6k157To+tpWDOFwqNlPpKhXCzNLX8xQAFQMSF
	rCi6SFsHnQGPSrz6zsNv2fHNtn2UX9CnHrQI6J0TzdLC3EQLYkMrTF+jAnolulzvJ3oA
	nE9PuOmRDhs+1wsuWUROm8Tu/2WWEkzYqHjPt+PRRULWFMN5gSAR+f1Bwd06blH6nwbY
	7kxd+ezqs2BHNzDBLsi2DDJVHWxIyC51kRX5TWvURiLHtxsekj3dyicQfZA285B4L15C
	rhkvYDO6r1X2fQKDwImm9IPdE3pGnqMPQ1D3Si18wTjmsMv6B+SO7D57w2jaXQC/oB4B
	BGMQ==
X-Gm-Message-State: AOAM531EWY22D1hnNQwpAzH/LkGd5w7DHleXzHfjGMcFK+DkT6iXbhO1
	4QLw2PZUmcgJNsb/qjQDGF6kZw==
X-Google-Smtp-Source: ABdhPJxAQ+fotSqwe8faCf5H7a8xb5y1avK/VcXmLBYp/UuZVxScgxz1HlQG03JVDuAyVp0hpf2MdQ==
X-Received: by 2002:a05:6a00:882:b029:2de:b01d:755a with SMTP id
	q2-20020a056a000882b02902deb01d755amr32457813pfj.43.1621982884571;
	Tue, 25 May 2021 15:48:04 -0700 (PDT)
Received: from cabot.adilger.int (S01061cabc081bf83.cg.shawcable.net.
	[70.77.221.9]) by smtp.gmail.com with ESMTPSA id
	n30sm15459221pgd.8.2021.05.25.15.48.03
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 May 2021 15:48:03 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <59253C17-3155-4ADF-B965-CEA375230483@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 25 May 2021 16:48:01 -0600
In-Reply-To: <YK1rebI5vZKCeLlp@casper.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost>
	<B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
	<YK1rebI5vZKCeLlp@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=HMjd6r8W; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.210.175 as permitted sender)
	smtp.mailfrom=adilger@dilger.ca
X-Mimecast-Spam-Score: -4
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: xfs <linux-xfs@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	NeilBrown <neilb@suse.com>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
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
Content-Type: multipart/mixed; boundary="===============5033975016987335885=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============5033975016987335885==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_47C6E327-64C0-41DB-8EFA-2AED6EDE9B5E";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_47C6E327-64C0-41DB-8EFA-2AED6EDE9B5E
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On May 25, 2021, at 3:26 PM, Matthew Wilcox <willy@infradead.org> wrote:
> 
> On Tue, May 25, 2021 at 03:13:52PM -0600, Andreas Dilger wrote:
>> Definitely "-o discard" is known to have a measurable performance impact,
>> simply because it ends up sending a lot more requests to the block device,
>> and those requests can be slow/block the queue, depending on underlying
>> storage behavior.
>> 
>> There was a patch pushed recently that targets "-o discard" performance:
>> https://patchwork.ozlabs.org/project/linux-ext4/list/?series=244091
>> that needs a bit more work, but may be worthwhile to test if it improves
>> your workload, and help put some weight behind landing it?
> 
> This all seems very complicated.  I have chosen with my current laptop
> to "short stroke" the drive.  That is, I discarded the entire bdev,
> then partitioned it roughly in half.  The second half has never seen
> any writes.  This effectively achieves the purpose of TRIM/discard;
> there are a lot of unused LBAs, so the underlying flash translation layer
> always has plenty of spare space when it needs to empty an erase block.
> 
> Since the steady state of hard drives is full, I have to type 'make clean'
> in my build trees more often than otherwise and remember to delete iso
> images after i've had them lying around for a year, but I'd rather clean
> up a little more often than get these weird performance glitches.
> 
> And if I really do need half a terabyte of space temporarily, I can
> always choose to use the fallow range for a while, then discard it again.

Sure, that's one solution for a 1TB laptop, but not large filesystems
that may be hundreds of TB per device.  I don't think the owners of
Perlmutter (https://www.nersc.gov/systems/perlmutter/) could be convinced
to avoid using 17PB of their flash to avoid the need for TRIM to work. :-)

Cheers, Andreas






--Apple-Mail=_47C6E327-64C0-41DB-8EFA-2AED6EDE9B5E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmCtfqEACgkQcqXauRfM
H+Dr7RAAv/S5K9b+d4nIh2CHohXKTdMiaX/wu1fLb671uTS1hPABVL+GTVxJlMnQ
J9zXWz0qOxR3XpjlaoaaDd4bp8sOvdiNyKCVspYt3dA2+70OXY0b3NCNoETx/xC+
MI8Bfe9nOvPd5mNq9RYLL1TmlLlEdYPkEgqQhlFSd2j5YFbTx91KQyIlGpmYJozy
wyQsEDLx68e/m8mVl4uDgycqVaR7ECzxDqntELWDD94pR9lecScZszOirZUdRWfy
o9/QuHI0GRsGH1ttenK00MvV2mtiHR4cB891nx63lrOKrQ6xW5dvu0/xGvWqtHUw
CGeWDC/ROL8cN1tAmD22z9cs+lgopez/ISysUW6GxhZn2z65vTw66ooBymT1PTHE
J3ZDVtnBW9lRDeCpAY0mTEvTc9OesBc8YiEB+Tz3XQnIk2eEKCvVWbio8OR+mPWs
32GVJHVc+jZDVUxDuV5HdWjErLndLIkfgylEZm0BHz6+se/beBTvfgZsY60o1VvL
sZGrITkdaGbTwb+FlQnNZd2Nj7/t1BqWm8uIYrORjGJshsct3N8lXH5MmBJlwenA
wezCKjE5kjCUjhVkpd31lSZQM/Jjycm1SWFt/YyZaiNA7C6MvvqzV327hvDUTwt7
LOMQ8MOtgO2/cRKta6uMOOmYnDaR9U07t8W/taStu+i8mvVvwVk=
=SSE/
-----END PGP SIGNATURE-----

--Apple-Mail=_47C6E327-64C0-41DB-8EFA-2AED6EDE9B5E--


--===============5033975016987335885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============5033975016987335885==--

