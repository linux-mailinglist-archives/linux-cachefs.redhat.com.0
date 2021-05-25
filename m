Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 60761390B17
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 23:14:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-n5ztHQrxMHO0bFvHzSb9LQ-1; Tue, 25 May 2021 17:14:01 -0400
X-MC-Unique: n5ztHQrxMHO0bFvHzSb9LQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75282107ACCA;
	Tue, 25 May 2021 21:13:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8D066EF40;
	Tue, 25 May 2021 21:13:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 028D855348;
	Tue, 25 May 2021 21:13:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PLDqDO001247 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 17:13:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE2F92010DF2; Tue, 25 May 2021 21:13:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E97200FA70
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 21:13:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0DAB8339A0
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 21:13:48 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1621977228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=EeOqnQg+7dXXxISpI+/z1lVcQlfEuvZGYlqAoOYXKhE=;
	b=OI5p1RDPYn2EVzQwgVlIHHpqCEAIgTkvOozUVwmy/nG+wP7SbGPc9DastorKlpEiE48+Bj
	h6xJfLI7RdCzP/ZhqYhdiBeHyPfjhvIU9yjhexEwTKRJ9/iUYU38HjQaz/i6Z6TdWH39DB
	GU/VqSg5GWUw2B4NgDC3OMEAEHIptq5EzzwBAKJHTCMi0Ys9sqx5GrDMdkI7WD6OrWnmuX
	XBqLNsRMK/NWW8Ap7zQTHWfvMqn4uOf/RYTCFC/3xmzzVOY2yA0zBi/40DEkZCx77vNAj6
	jj4ylQn2nhpiYMsHKxrkHlDHnv64zu8Em1IV+RnK1pWOslUj2LWtllxD953zvw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1621977228; a=rsa-sha256;
	cv=none;
	b=Jj0SNK3eLr9si+VIWpamcKd8D9XokjMFGO8r6CUUApyNaTgnyGG00AoqAd7IJWKvUXoyR7
	TskFl52FvVBK0ukElzl85FIhsnX9yt24t8YsecEP27IdS7QAgPdXM/4VMI/1Kzsc+SZYNn
	TFMB5kAcf4mEMf4yO9hSzcsLTuFSGD9m9VW5qz/xsZ3UWg9qS9C0mcX1ZOKkhnKRWIOAIn
	qxarGSZIhScj7wSEqHQ/+A/HylC3Kk+ww892pdnuFvGrEt95EVluaU3oQHTtP7ljYkbYKU
	JYbgUpQWloazDGCHOgbszOsXEOQmWaGlB8Bpvijnk6KlDFveQBwuCvvjaLIr1g==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=SOVprFe0; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.216.45 as permitted sender)
	smtp.mailfrom=adilger@dilger.ca
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-193-W3Up1pv6P929s_Zj7m6-Aw-1; Tue, 25 May 2021 17:13:46 -0400
X-MC-Unique: W3Up1pv6P929s_Zj7m6-Aw-1
Received: by mail-pj1-f45.google.com with SMTP id
	j6-20020a17090adc86b02900cbfe6f2c96so13917572pjv.1
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 14:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dilger-ca.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=JmM52i5DNThmfft1Cd0isHBrymiQJRyWSlR6uoOrusw=;
	b=SOVprFe0BzMa6/xG5BUaiLbSHmR6DfG13wobQJj5aVigGaL1CrXgB4LM2PB61Wc5MK
	hd1L83F5ploc2veZiGIHQkg7oZs+iYFtGvw/e46v62eESQjsWhYCRsZWqul3culutsus
	bm6FTuGfP0hTjoepFHswHJorzJm2OTx3c4yt7ykAHtkCaPs+b5yBeFFMfjChfLfF+szw
	w/6I0E7Q8axsSV0BBUWvBOAmkTeyG0lZ4TMcnkzmSocXd248/QfKJRwYu6An1y9f5jgy
	zrTCpJedVaZLOzM8cQ1UIS/k58G8nKVgPvFwGs02/krSIH3xXjdTrihwHYvguZ+0QD81
	giyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=JmM52i5DNThmfft1Cd0isHBrymiQJRyWSlR6uoOrusw=;
	b=Sipq3ELOyYIY1OCPpeoxjfXHrcHqvA95I+ge5cjpgZVfGmUS3Md9VQ+EkpRImRHy1y
	o4vTUeEBuHMifO9u35kA6TAM3Mdf/x6/NO+EIazEw1Y4rSr7Dsytcw7j+5wZ0MCZAONY
	rKRN4QYb62GCY4AZczM9XqQ4RzTBEok1hyQJf0w6oj/+QGUOhPy815a55IEgtqVCRPJd
	Fkyh7WRexM1mCiTcc4DvhWrYMTqhiDXqqsAfAJIOlWffQYhXq6WZTxNBKZYwBG7TmKsT
	b6RLNpOAVsHpHNyWL2rs8Le9etOCY0D7ye6PHx7qz6j9rnp3CvGIvyG8C0mcBKZ76ZR6
	0Row==
X-Gm-Message-State: AOAM532pWQFwl4C6NnzM7gySAVnFU68NFhmzzrr1WwaP3ACa8u2gspuy
	Xo/k3Rkxgq0JWQNqOzNAAvsavg==
X-Google-Smtp-Source: ABdhPJxovMaArTxrZUjDz9WBUBNLV77MQCbQ2dnAfC0ijKAmUCSCo+9SdO9Bfs9OvCAbEJYT0dkpow==
X-Received: by 2002:a17:90a:390a:: with SMTP id
	y10mr32412407pjb.9.1621977224576; 
	Tue, 25 May 2021 14:13:44 -0700 (PDT)
Received: from cabot.adilger.int (S01061cabc081bf83.cg.shawcable.net.
	[70.77.221.9]) by smtp.gmail.com with ESMTPSA id
	gb10sm13084005pjb.57.2021.05.25.14.13.43
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 May 2021 14:13:43 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 25 May 2021 15:13:52 -0600
In-Reply-To: <YKntRtEUoxTEFBOM@localhost>
To: Josh Triplett <josh@joshtriplett.org>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost>
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=SOVprFe0; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.216.45 as permitted sender)
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: xfs <linux-xfs@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============4598574250048828927=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============4598574250048828927==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_794BFB72-2A90-4EC6-873C-64F5CD31A56E";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_794BFB72-2A90-4EC6-873C-64F5CD31A56E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On May 22, 2021, at 11:51 PM, Josh Triplett <josh@joshtriplett.org> wrote:
>=20
> On Thu, May 20, 2021 at 11:13:28PM -0600, Andreas Dilger wrote:
>> On May 17, 2021, at 9:06 AM, David Howells <dhowells@redhat.com> wrote:
>>> With filesystems like ext4, xfs and btrfs, what are the limits on direc=
tory
>>> capacity, and how well are they indexed?
>>>=20
>>> The reason I ask is that inside of cachefiles, I insert fanout director=
ies
>>> inside index directories to divide up the space for ext2 to cope with t=
he
>>> limits on directory sizes and that it did linear searches (IIRC).
>>>=20
>>> For some applications, I need to be able to cache over 1M entries (rend=
er
>>> farm) and even a kernel tree has over 100k.
>>>=20
>>> What I'd like to do is remove the fanout directories, so that for each =
logical
>>> "volume"[*] I have a single directory with all the files in it.  But th=
at
>>> means sticking massive amounts of entries into a single directory and h=
oping
>>> it (a) isn't too slow and (b) doesn't hit the capacity limit.
>>=20
>> Ext4 can comfortably handle ~12M entries in a single directory, if the
>> filenames are not too long (e.g. 32 bytes or so).  With the "large_dir"
>> feature (since 4.13, but not enabled by default) a single directory can
>> hold around 4B entries, basically all the inodes of a filesystem.
>=20
> ext4 definitely seems to be able to handle it. I've seen bottlenecks in
> other parts of the storage stack, though.
>=20
> With a normal NVMe drive, a dm-crypt volume containing ext4, and discard
> enabled (on both ext4 and dm-crypt), I've seen rm -r of a directory with
> a few million entries (each pointing to a ~4-8k file) take the better
> part of an hour, almost all of it system time in iowait. Also makes any
> other concurrent disk writes hang, even a simple "touch x". Turning off
> discard speeds it up by several orders of magnitude.
>=20
> (I don't know if this is a known issue or not, so here are the details
> just in case it isn't. Also, if this is already fixed in a newer kernel,
> my apologies for the outdated report.)

Definitely "-o discard" is known to have a measurable performance impact,
simply because it ends up sending a lot more requests to the block device,
and those requests can be slow/block the queue, depending on underlying
storage behavior.

There was a patch pushed recently that targets "-o discard" performance:
https://patchwork.ozlabs.org/project/linux-ext4/list/?series=3D244091
that needs a bit more work, but may be worthwhile to test if it improves
your workload, and help put some weight behind landing it?

Another proposal was made to change "-o discard" from "track every freed
block and submit TRIM" to "(persistently) track modified block groups and
submit background TRIM like fstrim for the whole group".  One advantage
of tracking the whole block group is that block group state is already
maintained in the kernel and persistently on disk.  This also provides a
middle way between "immediate TRIM" that may not cover a whole erase block
when it is run, and "very lazy fstrim" that aggregates all free blocks in
a group but only happens when fstrim is run (from occasionally to never).

The in-kernel discard+fstrim handling could be smarter than "run every day
from cron" because it can know when the filesystem is busy or not, how much
data has been written and freed, and when a block group has a significant
amount of free space and is useful to actually submit the TRIM for a group.

The start of that work was posted for discussion on linux-ext4:
https://marc.info/?l=3Dlinux-ext4&m=3D159283169109297&w=3D4
but ended up focussed on semantics of whether TRIM needs to obey requested
boundaries for security reasons, or not.

Cheers, Andreas






--Apple-Mail=_794BFB72-2A90-4EC6-873C-64F5CD31A56E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmCtaJIACgkQcqXauRfM
H+B43g//XXljpnvCDqmJdZoi3BWDl8BXab4KwkTguFmad56XaZQHFlCLjW0AhBHE
zsBcuVk/C2ZsO4lwRUL02JtXD2fWB/VQ2lTFQ7dL0RPyL5QIvt0ineeUjm7Ik/nC
bqu1GSoTyNCKV37S25mnsYfM9+pxuHongQu1q5cXzdEzqi6Lk2Wpe0o6ktw0M0us
08YX+B4g2aGgk1zjlnpiTBCjlbSpst91AhoLmjfdL+oDIHqG17HV0gonZsy+84W4
kHqb/IPAiDQJ+FCHGIbpRoMlXVYB6G265m+e2vECMi1+wiXxBLIJsxvjYk3vd1k/
ZHtY67f5UNQAqU/TeYhlTpNdfwUs0nYb85oYGMR/db1kDQj1vCh/OS6SZKjQj/fl
a5cjREGb8ts+JYvVTYLQYbMtsBMtFSimss6HRl9SrI5N18zMGT9ffdSjciZaTdaM
51gtZd06Vs9cR3K91xaJqa6NVo/BrTrFqNmZP0ccxPa9kRzKwzfQbvF9s2wF75va
9rx5ouzLvrbZDqGVM5VjYumJtptvLAigoCFa3F1R/ebdwer3Rbn6GMLFbttZ98zd
vvoGxgQVmBAYMt6SqYpZ2nr8gygFTr0guzN+xRp6ynlHusVOkbfSNrR8x0k7ZA96
kqU0BeziMpUL5r7OL6casG/bSRUxgKgdHi9sP+jmAK2yu6S+aG8=
=P+t3
-----END PGP SIGNATURE-----

--Apple-Mail=_794BFB72-2A90-4EC6-873C-64F5CD31A56E--


--===============4598574250048828927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============4598574250048828927==--

