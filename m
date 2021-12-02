Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3464B4667B1
	for <lists+linux-cachefs@lfdr.de>; Thu,  2 Dec 2021 17:14:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29--3G9INd4P1OkggNizSOGUA-1; Thu, 02 Dec 2021 11:14:39 -0500
X-MC-Unique: -3G9INd4P1OkggNizSOGUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523A084BA66;
	Thu,  2 Dec 2021 16:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D695D19811;
	Thu,  2 Dec 2021 16:14:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 399DF4BB7C;
	Thu,  2 Dec 2021 16:14:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2GEN4w007734 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 11:14:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 24292492C3B; Thu,  2 Dec 2021 16:14:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F63D492C38
	for <linux-cachefs@redhat.com>; Thu,  2 Dec 2021 16:14:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05CE2811E76
	for <linux-cachefs@redhat.com>; Thu,  2 Dec 2021 16:14:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-322-9NbAzgvxOCOv83W9u_QvBg-1; Thu, 02 Dec 2021 11:14:19 -0500
X-MC-Unique: 9NbAzgvxOCOv83W9u_QvBg-1
Received: by mail-ed1-f53.google.com with SMTP id v1so236485edx.2;
	Thu, 02 Dec 2021 08:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=cb/wMGNOhwX9zMYZn7+hTfD7KSDc+wnhDPy2SNk0YVE=;
	b=FnzUE5ywrOxVxy+S4XqMM/vISQAdnRpCaStVvB9YsyNLzLkUsJhUa/ptZy57H9Ck/3
	+fBu2h6Qx4IvBqe1o3zUnuAUAkMoVOM1Ye2txUkMgfYG/JNUlH2xINSB20v/v052l+hZ
	43LsJItWsxwP7UAuOj0YcOiQJVUtbyX/t6rEsx+X/PfbFaKYFzwhc5iPh6cNI7uMoQ0i
	HAlbJ/bBfraM4Fc3vrJar/ti76PCaoEwp4a54Zm1/tfXXJ6UeWMws9fWG5Xxo+jGM1+f
	rfMU5C79Do8l5FJVvyZe5esh/Vq/jpzJs/6h+wG/dsfmmbp0JZBAv+1J5jSP5Ej3v/hw
	3fCQ==
X-Gm-Message-State: AOAM5302Pe7V4Lwxg/EfsJtGHGxK95RVIFd2eL0TA780ZV2rk+InG8S2
	XoX/lCCpg1c/HxyIFANWH18+fAnm2SViCrBDBDI=
X-Google-Smtp-Source: ABdhPJxT2gxYPhEE87c8SrDepDK+kaace9SntsE6A16rZPN/ooArVVGmVWxS4ZsmVj+F01HGh5PCmd6QGF33pCj4S1U=
X-Received: by 2002:a05:6402:1613:: with SMTP id
	f19mr18720417edv.322.1638461657727; 
	Thu, 02 Dec 2021 08:14:17 -0800 (PST)
MIME-Version: 1.0
References: <CANT5p=qfOdaFQF+EUgjgQx=zGb09FCu=zjZ7q622G--dUy7F3w@mail.gmail.com>
In-Reply-To: <CANT5p=qfOdaFQF+EUgjgQx=zGb09FCu=zjZ7q622G--dUy7F3w@mail.gmail.com>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Thu, 2 Dec 2021 21:44:06 +0530
Message-ID: <CANT5p=r5WgGN9Txpa=NmPVO72kmzUb609_r06N3P-nAhkwJg9A@mail.gmail.com>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Paulo Alcantara <pc@cjr.nz>, David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@redhat.com>, linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH SET] fscache fixes
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

On Thu, Dec 2, 2021 at 5:32 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> Hi Steve,
>
> Please review and consider the following fixes in fscache integration
> of cifs.ko.
>
> https://github.com/sprasad-microsoft/smb3-kernel-client/commit/d70e50047c7daa3de17c7c41a0c4ef4f9e4443c9.patch
> https://github.com/sprasad-microsoft/smb3-kernel-client/commit/089dd629653b857b6096966e9d2df301653a36ea.patch
> https://github.com/sprasad-microsoft/smb3-kernel-client/commit/a9a62cdfe26c782dadd0b94ab529b883426d0acd.patch
>
> --
> Regards,
> Shyam

Adding David and Jeff for review.

-- 
Regards,
Shyam

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

