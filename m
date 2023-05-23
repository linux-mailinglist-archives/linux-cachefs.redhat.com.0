Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33370DB5A
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 May 2023 13:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684840722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sNDsnuXhxvoSxedmZKgg70Dt8EC1gjft/6kbiPW3kCw=;
	b=gjGUL3zjvzjyov7Q6fO1BkjxSPlAaU2w8UDJ9b+aR5OegDCk6Wm6Iz4vPIs9CLY1nquVhq
	1UPdVw4L2qeOWtmy6+vdSJEJNb4lAy2YvYFs8fyUAhJmUxL8Ae/Ys+4skHtHELiJvMyqkj
	P6tff1kEzijebt7DrwBBAL9DzGuc4Xs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-FaBEM1aoM-GnKcY9aVcZFw-1; Tue, 23 May 2023 07:18:39 -0400
X-MC-Unique: FaBEM1aoM-GnKcY9aVcZFw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F64C1C05158;
	Tue, 23 May 2023 11:18:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1FDC492B0A;
	Tue, 23 May 2023 11:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2268519465B3;
	Tue, 23 May 2023 11:18:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1ABBE19465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 23 May 2023 11:18:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D82AD1121315; Tue, 23 May 2023 11:18:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0F8A1121314
 for <linux-cachefs@redhat.com>; Tue, 23 May 2023 11:18:24 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B37703802607
 for <linux-cachefs@redhat.com>; Tue, 23 May 2023 11:18:24 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-j1eZO9yaOjeqDRb4eYGZOw-1; Tue, 23 May 2023 07:18:21 -0400
X-MC-Unique: j1eZO9yaOjeqDRb4eYGZOw-1
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-96fffe11714so332628766b.0; 
 Tue, 23 May 2023 04:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684840700; x=1687432700;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zNJf1ZxIlrz72iFEKXCdEhtPieGC/o/YCVkxcPf5Cw=;
 b=cq0+87MKuls7mQBF4au/W3/picw+Cu2frhrqB2MHS1e/guhSLheaKpi9axKpJD02gH
 KJtVi9Y1RvRNKllpjM9oIY9dA5T/U/AlITPPa7kLGd6IjICil9QGro2QKtOaVhSmzjf8
 qzAwEE1yaejtdQKJ03Hcv9zdpUheQyEzLkRXZIOPtmnfsT8EAAUeD7j4caB6rwTVidMu
 gTRcBmuxrlvZQli0Ile8YIbA6OI+RjWHZf73dAvtdQe02wh56o+QuyVDMuCop13neH9r
 TrauH8NBfY00+XTJzm59GlYe7kZdPPWSRTU6USY7dM3DUonZhJMalaEYkwv4uk2Wiubh
 NEIw==
X-Gm-Message-State: AC+VfDysUxuQKHCOqW1bRnU0mMsvREjKLXC8AXRDTTVPp7046IKQE1Da
 EL1lmqZ8JYnaSgMXIbPf52bldXzxazdTOA50GUR+6YzlsqI=
X-Google-Smtp-Source: ACHHUZ59THj5Tswww4xenEpO4c8mhlINpyXFkxbCi+i4JA9RU6XtgIVQFed0jO+NQcfy2Oiz/sTbAEQgMp4XniOrwSI=
X-Received: by 2002:a17:906:5d04:b0:95e:d74b:d171 with SMTP id
 g4-20020a1709065d0400b0095ed74bd171mr13436332ejt.28.1684840699474; Tue, 23
 May 2023 04:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
 <1744185.1684489212@warthog.procyon.org.uk>
In-Reply-To: <1744185.1684489212@warthog.procyon.org.uk>
From: Chris Chilvers <chilversc@gmail.com>
Date: Tue, 23 May 2023 12:18:08 +0100
Message-ID: <CAAmbk-ffz-6LqkEo+XavgiuefZK7BOHC7648ZhSs0BN88N=M4A@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [BUG] fscache writing but not reading
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
Cc: Benjamin Maynard <benmaynard@google.com>, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, brennandoyle@google.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 19 May 2023 at 10:40, David Howells <dhowells@redhat.com> wrote:
>
> Chris Chilvers <chilversc@gmail.com> wrote:
>
> > While testing the fscache performance fixes [1] that were merged into 6.4-rc1
> > it appears that the caching no longer works. The client will write to the cache
> > but never reads.
>
> Can you try reading from afs?  You would need to enable CONFIG_AFS_FS in your
> kernel if it's not already set.
>
> Install kafs-client and do:
>
>         systemctl enable afs.mount
>         md5sum /afs/openafs.org/software/openafs/1.9.1/openafs-1.9.1-doc.tar.bz2
>         cat /proc/fs/fscache/stats

FS-Cache statistics
Cookies: n=13 v=7 vcol=0 voom=0
Acquire: n=13 ok=13 oom=0
LRU    : n=1 exp=0 rmv=0 drp=0 at=2833
Invals : n=0
Updates: n=0 rsz=0 rsn=0
Relinqs: n=0 rtr=0 drop=0
NoSpace: nwr=0 ncr=0 cull=0
IO     : rd=0 wr=18
RdHelp : RA=18 RP=0 WB=0 WBZ=0 rr=0 sr=0
RdHelp : ZR=1 sh=0 sk=0
RdHelp : DL=18 ds=18 df=0 di=0
RdHelp : RD=0 rs=0 rf=0
RdHelp : WR=18 ws=18 wf=0

This was on an instance that was only just created, so the cache was
initially unused (all the counters were 0).

>         umount /afs/openafs.org
>         md5sum /afs/openafs.org/software/openafs/1.9.1/openafs-1.9.1-doc.tar.bz2
>         cat /proc/fs/fscache/stats

FS-Cache statistics
Cookies: n=13 v=7 vcol=0 voom=0
Acquire: n=26 ok=26 oom=0
LRU    : n=1 exp=1 rmv=0 drp=0 at=467
Invals : n=0
Updates: n=0 rsz=0 rsn=0
Relinqs: n=13 rtr=0 drop=13
NoSpace: nwr=0 ncr=0 cull=0
IO     : rd=18 wr=18
RdHelp : RA=36 RP=0 WB=0 WBZ=0 rr=0 sr=0
RdHelp : ZR=1 sh=0 sk=0
RdHelp : DL=18 ds=18 df=0 di=0
RdHelp : RD=18 rs=18 rf=0
RdHelp : WR=18 ws=18 wf=0

Looks like the cache is working fine with AFS. The second md5sum
seemed a lot quicker than the first.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

