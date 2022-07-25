Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C0583BD5
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Jul 2022 12:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659003118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CzS+FsNFvzFd/xIRFHjmVGDnqtdPjFCEBdfjHQxYRqQ=;
	b=XD58r4bFGhICkjLDWdWU5DsFDB5EgexoROaXFbhEJ9CSoBFK14Tj6fYbmfPwpyYVb+ea4e
	S0E5aFXAuP9SmH/qoOrr9WZL8DDVKFvPF8Z/5oynI9lArHlnUZm3bYmCon5tqEN3YUrrEY
	IYk5tRERYQOaa+ej91Ct4w2JcCsN1zQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-RlQC3O0pM9mLRpEQ8V8z2A-1; Thu, 28 Jul 2022 06:11:55 -0400
X-MC-Unique: RlQC3O0pM9mLRpEQ8V8z2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5334A80030A;
	Thu, 28 Jul 2022 10:11:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4330E2166B29;
	Thu, 28 Jul 2022 10:11:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F7D01945DAE;
	Thu, 28 Jul 2022 10:11:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 137DA1945D83 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 13:57:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF79A40CFD05; Mon, 25 Jul 2022 13:57:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6455400EA85
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 13:57:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD48585A585
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 13:57:10 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-vHq5DLNnP72jJiVf1AkQKQ-1; Mon, 25 Jul 2022 09:57:09 -0400
X-MC-Unique: vHq5DLNnP72jJiVf1AkQKQ-1
Received: by mail-ot1-f42.google.com with SMTP id
 g19-20020a9d1293000000b0061c7bfda5dfso8713412otg.1
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+l85BsyJSU0UbHlmYMEOxONRkWum9Iis0lj7YjgVouo=;
 b=dWdcUyQoIWk8uY6m8Acu/6HDsqLWDHzisKnne/RysGVugfZ5HKopOqqUvUSB54/4Rt
 j/gBUlP2+2c7V9+Dko1QRuiFheGBOpKFcbrV46N4/z+JT8TxMwjN0gR5u9K3qKD9R7l6
 ObkJQXyJa8I7owcWJxg7fumn3XAkwAHq67YL7IXKmIS3xettfQ3Et2ccEaC7rq6kBiKL
 PQ8qWETGGw4h+UG/8upVqTuDqcF99cyOwepu1Zhl0edMRik6FCZBiqDQjq62liQbU+S+
 /E72R4reieefw2bx13pxMm2yGNXpuW79nTNtf2gBFiYeHageOerRolZ06Y2/B2gO57j/
 ro7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+l85BsyJSU0UbHlmYMEOxONRkWum9Iis0lj7YjgVouo=;
 b=eeoGruGYtkbTLkI1j6oJmwb1qL002rizGHg4QuIkc2TKnkOGC91agp2tC8xsumO6Dc
 MOQs7Z8sIv9SuI7sKqjAllWspZu5r5hN5eVIh16c9MMTkvAokY6d106XXBUVdThnMaiD
 9DXe2vJpUlu4QGDY0lRp8FFYIr5tORFif3LUl5Lw2jJp48uV7+vpwS5vIRn42IfjMz9z
 JBT2Rk97zPoH2wo3HWmQEYaMLRJOQ5i18RVvb7Vi/0tgX/HfQC2ofxXddm29sv/rodXF
 yNd9R89qzyuLekIQdH/xhFdK0m4houSgMd23qadjnJ6Q7Mn2+Sh9vghww45o/T01Flm1
 krew==
X-Gm-Message-State: AJIora+4OIRouKcI1SAoOng4DZqqtfPFzu0Ht93+ixf/fCxt79aXACw5
 BPsCECqu371ZVFKilsmXNZU8bw==
X-Google-Smtp-Source: AGRyM1viWeGZygpCAGA/0LqaHJ3iwJEX7OK5ms8z7lEOosaUtO+XSEMo/iWU3So71mv+MCTq135fvw==
X-Received: by 2002:a05:6830:43aa:b0:61c:b46d:c88a with SMTP id
 s42-20020a05683043aa00b0061cb46dc88amr4981097otv.19.1658757428382; 
 Mon, 25 Jul 2022 06:57:08 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net.
 [69.109.179.158]) by smtp.gmail.com with ESMTPSA id
 d24-20020a05680805d800b0032f63c4638esm4935090oij.2.2022.07.25.06.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 06:57:07 -0700 (PDT)
Date: Mon, 25 Jul 2022 09:57:04 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Joe Perches <joe@perches.com>
Message-ID: <Yt6hMD+HIaERgrqg@fedora>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
 <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
 <YtnlAg6Qhf7fwXXW@MiWiFi-R3L-srv>
 <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Thu, 28 Jul 2022 10:11:52 +0000
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
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
Cc: linux-cachefs <linux-cachefs@redhat.com>,
 linux-doc <linux-doc@vger.kernel.org>, peterz <peterz@infradead.org>,
 bigeasy <bigeasy@linutronix.de>, ast <ast@kernel.org>, song <song@kernel.org>,
 sdf <sdf@google.com>, will <will@kernel.org>, daniel <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, "john.fastabend" <john.fastabend@gmail.com>,
 andrii <andrii@kernel.org>, mingo <mingo@redhat.com>, yhs <yhs@fb.com>,
 dyoung <dyoung@redhat.com>, vgoyal <vgoyal@redhat.com>,
 "boqun.feng" <boqun.feng@gmail.com>, kpsingh <kpsingh@kernel.org>,
 Slark Xiao <slark_xiao@163.com>, longman <longman@redhat.com>,
 tglx <tglx@linutronix.de>, haoluo <haoluo@google.com>,
 Baoquan He <bhe@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 kexec <kexec@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 jolsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 "martin.lau" <martin.lau@linux.dev>, kafai <kafai@fb.com>
Content-Type: multipart/mixed; boundary="===============5889595441184504459=="
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6


--===============5889595441184504459==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DTlmFVa4wvwu5Zvn"
Content-Disposition: inline


--DTlmFVa4wvwu5Zvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 06:52:15AM -0700, Joe Perches wrote:
> On Fri, 2022-07-22 at 07:45 +0800, Baoquan He wrote:
> > On 07/21/22 at 11:40am, Randy Dunlap wrote:
> > > On 7/21/22 11:36, Jonathan Corbet wrote:
> > > > "Slark Xiao" <slark_xiao@163.com> writes:
> > > > > May I know the maintainer of one subsystem could merge the changes
> > > > > contains lots of subsystem?  I also know this could be filtered by
> > > > > grep and sed command, but that patch would have dozens of maintai=
ners
> > > > > and reviewers.
> > > >=20
> > > > Certainly I don't think I can merge a patch touching 166 files acro=
ss
> > > > the tree.  This will need to be broken down by subsystem, and you m=
ay
> > > > well find that there are some maintainers who don't want to deal wi=
th
> > > > this type of minor fix.
> > >=20
> > > We have also seen cases where "the the" should be replaced by "then t=
he"
> > > or some other pair of words, so some of these changes could fall into
> > > that category.
> >=20
> > It's possible. I searched in Documentation and went through each place,
> > seems no typo of "then the". Below patch should clean up all the 'the t=
he'
> > typo under Documentation.
> []
> > The fix is done with below command:
> > sed -i "s/the the /the /g" `git grep -l "the the " Documentation`
>=20
> This command misses entries at EOL:
>=20
> Documentation/trace/histogram.rst:  Here's an example where we use a comp=
ound key composed of the the
>=20
> Perhaps a better conversion would be 's/\bthe the\b/the/g'

It would be good to check for instances that cross newlines as well;
i.e. "the" at the end of a line followed by "the" at the start of the
next line. However, this would require some thought to properly account
for comment blocks ("*") and other similar prefixes that should be
ignored.

William Breathitt Gray

--DTlmFVa4wvwu5Zvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYt6hMAAKCRC1SFbKvhIj
K7XjAP9mCPlMDtWSBhCoUhLhlZfaG0XycbJFaNDw81dAkUz2RQD+Kobc2FhQZM+x
KR+ZpOFEIOreTL3gE48zETF6lxcxUAI=
=FuCv
-----END PGP SIGNATURE-----

--DTlmFVa4wvwu5Zvn--


--===============5889595441184504459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

--===============5889595441184504459==--

