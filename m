Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CD5AA462
	for <lists+linux-cachefs@lfdr.de>; Fri,  2 Sep 2022 02:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662078644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pLVvfsxFL72SnXiJ2y0PJipmHe7bJ5NnxcAX4UUxHu8=;
	b=c1V1BLjYn4p3D6FFShokPapV4zyrYkrX1ZgtZ1bgBEek4ayXM0ykur8bfGubHfQyRxKdEY
	HxRj61A/HDL6q7ll66uXlPA5s8+WTdXvlJCn3VPsGG55aeg8+yexqzMlHxRirwHQX0/Xh6
	aT3GRqAhrH2uiOOh1j7Xx1odL1OPLvk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Jy7IGsksM3a7FjzqyLV78g-1; Thu, 01 Sep 2022 20:30:43 -0400
X-MC-Unique: Jy7IGsksM3a7FjzqyLV78g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F14BD976FE3;
	Fri,  2 Sep 2022 00:30:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7A040CF8F2;
	Fri,  2 Sep 2022 00:30:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A91B194B966;
	Fri,  2 Sep 2022 00:30:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9E5181946A5E for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  2 Sep 2022 00:30:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 31128112131E; Fri,  2 Sep 2022 00:30:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D8501121314
 for <linux-cachefs@redhat.com>; Fri,  2 Sep 2022 00:30:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1292585A589
 for <linux-cachefs@redhat.com>; Fri,  2 Sep 2022 00:30:39 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-KmBD7g6lOXSN8R0DD67YIg-1; Thu, 01 Sep 2022 20:30:38 -0400
X-MC-Unique: KmBD7g6lOXSN8R0DD67YIg-1
Received: by mail-io1-f71.google.com with SMTP id
 l15-20020a0566022dcf00b00688e70a26deso330435iow.12
 for <linux-cachefs@redhat.com>; Thu, 01 Sep 2022 17:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rDZu8IIo6FPE/pW88XoO5299clxnp4rO8KLGZtj/WqU=;
 b=m06bN+CeDf8OW46QT5DGMAZlgsbraM98zrpwPGl2af1I9QsVXSY+bkZjbNa35quRx2
 R3NXW+KhrcHJy87N3KM+/rI3I5usEk7G6kanYo+RSKn+3QpJzSEBFZB59ucgErXzb9xv
 NQhabDG1WBpVAv0jbT6wIlwjm0fM8+HB3vKosCkRb5x0HTIVbBCUfrfQF9FgHaaxbRsb
 +wtHSXqqSzcRV3PwuVFIxWBSEkWsw2rAIVyKvea2UgGTZQYw1y0FYzoKIPJJmjB9jsr/
 NZBpHY7Yq94f7govLDHjKuqXsHYJA8vTY1M2FEpUZCqNdVUBVxkUmSxcSvEHAobsMeLw
 sl/A==
X-Gm-Message-State: ACgBeo0RSXTUkGI+uo17/NBVMmL9LkbNC6CYdagxYQinDvAzFoX8xdxM
 UxTv9yNnoy0kZ4GahHU+EIPdGI07/h9Qj9EA4cm/FQLfnuxydy47z0YdJsUSaYEuND2FpF7myMq
 Qb/rps/5sy1SOnOCHJqEzoV/4PhDPW6kQrj8G3A==
X-Received: by 2002:a05:6e02:1566:b0:2e5:a1e7:7e15 with SMTP id
 k6-20020a056e02156600b002e5a1e77e15mr18070501ilu.122.1662078637323; 
 Thu, 01 Sep 2022 17:30:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GNEbo0HFrxRlkS8cFvm/4EqoJtG46l3ycAfgK47CcGAB1FjQ4c1MCzUsZ6rBC4gPoPrJawBhcVFjyIgvAjTc=
X-Received: by 2002:a05:6e02:1566:b0:2e5:a1e7:7e15 with SMTP id
 k6-20020a056e02156600b002e5a1e77e15mr18070485ilu.122.1662078637075; Thu, 01
 Sep 2022 17:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <Yk9V/03wgdYi65Lb@casper.infradead.org>
 <Yk5W6zvvftOB+80D@casper.infradead.org>
 <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
 <164928630577.457102.8519251179327601178.stgit@warthog.procyon.org.uk>
 <469869.1649313707@warthog.procyon.org.uk>
 <3118843.1650888461@warthog.procyon.org.uk>
 <YmaUUezsM+AS5R4y@casper.infradead.org>
In-Reply-To: <YmaUUezsM+AS5R4y@casper.infradead.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 1 Sep 2022 20:30:01 -0400
Message-ID: <CALF+zOnWkEHAmGfEcGccgL8dJw1U3sPSQ1iYndqMB885k9f_eA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH 14/14] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 linux-cifs <linux-cifs@vger.kernel.org>,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 linux-cachefs <linux-cachefs@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 25, 2022 at 8:30 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Apr 25, 2022 at 01:07:41PM +0100, David Howells wrote:
> > Matthew Wilcox <willy@infradead.org> wrote:
> >
> > > OK.  You suggested that releasepage was an acceptable place to call it.
> > > How about we have AS_RELEASE_ALL (... or something ...) and then
> > > page_has_private() becomes a bit more complicated ... to the point
> > > where we should probably get rid of it (by embedding it into
> > > filemap_release_folio():
> >
> > I'm not sure page_has_private() is quite so easy to get rid of.
> > shrink_page_list() and collapse_file(), for example, use it to conditionalise
> > a call to try_to_release_page() plus some other bits.
>
> That's what I was saying.  Make the calls to try_to_release_page()
> unconditional and delete page_has_private() because it only confuses
> people who should actually be using PagePrivate().
>
> > I think that, for the moment, I would need to add a check for AS_RELEASE_ALL
> > to page_has_private().
> >
> > David
> >
> >
>

I am not sure what the next steps are here but I wanted to ping about
this patch.  NFS also needs this patch or something like it.  David are
you planning to submit an updated series with an updated patch?

A partial backport of David's original patch here on top of my v3 NFS
netfs conversion patches [1] resolves one of my unit test failures
where there were extra reads from the network instead of the cache.
Also Daire Byrne indicates that he too was seeing the same thing
and he tested my patches below and it resolved his issue as well.
Note that I needed another netfs patch in this series,
"netfs: Provide invalidatepage and releasepage calls"
on top of this one, to resolve the problem.

[1] https://github.com/DaveWysochanskiRH/kernel/commits/nfs-fscache-netfs-removing-folio
$ git log --oneline | head
ad90bddf6570 NFS: Add usage of new VFS API removing folio
9e2a7c301564 mm,netfs: Add removing_folio() to stop netfs read
optimization (TEST ONLY)
776088910162 netfs: Provide invalidatepage and releasepage calls
8aa1379ceb49 NFS: Convert buffered read paths to use netfs when
fscache is enabled
807808d87040 NFS: Configure support for netfs when NFS fscache is configured
43a41cce491d NFS: Rename readpage_async_filler to nfs_pageio_add_page
b90cb1053190 Linux 6.0-rc3

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

