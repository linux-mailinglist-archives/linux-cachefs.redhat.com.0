Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27348A7C6
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Jan 2022 07:38:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-4pE1ZaJ9O1iorkcPriQsBw-1; Tue, 11 Jan 2022 01:38:41 -0500
X-MC-Unique: 4pE1ZaJ9O1iorkcPriQsBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 761621006AA4;
	Tue, 11 Jan 2022 06:38:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4846A10589A5;
	Tue, 11 Jan 2022 06:38:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1F8F4BB7C;
	Tue, 11 Jan 2022 06:38:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20B6cTSF018306 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 01:38:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5167C1402403; Tue, 11 Jan 2022 06:38:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5F71402401
	for <linux-cachefs@redhat.com>; Tue, 11 Jan 2022 06:38:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3332B101A52D
	for <linux-cachefs@redhat.com>; Tue, 11 Jan 2022 06:38:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-244-g5ni9QjENwCVBuqTaa1S5Q-1; Tue, 11 Jan 2022 01:38:27 -0500
X-MC-Unique: g5ni9QjENwCVBuqTaa1S5Q-1
Received: by mail-pl1-f175.google.com with SMTP id p14so15669631plf.3;
	Mon, 10 Jan 2022 22:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=trdH5U3ZH/R/FeiqmnXhMnWYYB140Ia2g3EsF9oYRN0=;
	b=SCwoQifZFuWMq5ZFv5SrS2loE4Huf/R1MtaAXgzr0uod4q72rqNB/NDXvQSE8vo8GS
	6JJ7rqUp8O8DE/TNk/nvqid7fVEHhGJeeuGzjDkxvjvoNQiz40myeAKvZbPBjAFiXqcA
	sU3d/dC+6btxRf6zcfbQTtBd4/kTInrPjPdqgzykDHGHC3zograqkvR73mn5OrlmqBxP
	Z4cCK3eeZlAECjDuCtR/4GxP+lW0fWJwjsWLDN8ntZy0qMRM/qt0oVg4fr+34YR5XcW/
	T9cB9VxVF/DGBxacTg/ICvWB6BI7atUS93Yx/8yzc+962WqRA1EIHbliHDWupmIim0ut
	yEGA==
X-Gm-Message-State: AOAM531ImNSnBHvnKisVT6z65UI3AMwUWULmrGzp4+MPcUxyaWQSyA2U
	+wY1V8nTUQkZ+1nfrEICbX7Ew2lIcm8=
X-Google-Smtp-Source: ABdhPJwjhzEmT+z7t9tPrPuR8fV0mHEjmwej3UHg+1HhyfobodOUg9tmFoudxBrzspwvxGlFx4Vrwg==
X-Received: by 2002:a17:90b:1b4a:: with SMTP id
	nv10mr850515pjb.190.1641883105456; 
	Mon, 10 Jan 2022 22:38:25 -0800 (PST)
Received: from xzhoux.usersys.redhat.com ([209.132.188.80])
	by smtp.gmail.com with ESMTPSA id
	m14sm8233859pff.151.2022.01.10.22.38.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Jan 2022 22:38:24 -0800 (PST)
Date: Tue, 11 Jan 2022 14:38:20 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20220111063820.ncjtglcnqp5njzv5@xzhoux.usersys.redhat.com>
References: <20220110052313.ax6ory7xaevbttoe@xzhoux.usersys.redhat.com>
	<CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
	<3790640.1641819409@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3790640.1641819409@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cachefs@redhat.com,
	Murphy Zhou <jencce.kernel@gmail.com>, Steve French <smfrench@gmail.com>
Subject: Re: [Linux-cachefs] [ linux-next ] 20211206 tree cifs panic
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

On Mon, Jan 10, 2022 at 12:56:49PM +0000, David Howells wrote:
> David Howells <dhowells@redhat.com> wrote:
> 
> > > It's still reproducible on the latest next-20210107 tree with below
> > > reproducer.
> > 
> > If you meant next-20220107 then that's using the v4 version of the patches;
> > there is a v5, though I've only posted an updated cifs patch, that is in
> > next-20220110.  I'm not sure if it would help, though.
> 
> I managed to set up and run cthon04.  I can confirm that it throws out lots of
> oopses with fscache-rewrite-v4 (see below for an example of such):
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/tag/?h=fscache-rewrite-v4
> 
> but seems to work fine with v5:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-rewrite
> 
> both with and without a cache attached.
> 

Ya, 0110 tree passed all tests.

Thank you David!

Murphy

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

