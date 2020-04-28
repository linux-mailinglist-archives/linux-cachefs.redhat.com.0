Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5401C3713
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 May 2020 12:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588588764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=18zASY4sdKK4X3DGdBOF2rbNixcdNHzvRxmOfx12x7w=;
	b=EED431TzUqExas7M3MMPrJDDgI494yy3+3R24UsFzkDgLLzC1zv7YQrzKGdPQuMMRMdHbP
	UHrFW5BMxRW9P4YVfFe0rfUKBHSldDSTxnCLtZx2iyIui0Bv8nm9OorK3ViVNIg/dTlgzt
	EUCAMupcqe2ARNzu4tEdhgCdjHKTsS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-jBDuWTQIMYy-TCDYKvfQlg-1; Mon, 04 May 2020 06:39:21 -0400
X-MC-Unique: jBDuWTQIMYy-TCDYKvfQlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553AF8064D8;
	Mon,  4 May 2020 10:39:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB8562A07;
	Mon,  4 May 2020 10:39:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E6D84CA94;
	Mon,  4 May 2020 10:39:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SJPH1M002453 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 15:25:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 396B62156A2E; Tue, 28 Apr 2020 19:25:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 358CE2156A3A
	for <linux-cachefs@redhat.com>; Tue, 28 Apr 2020 19:25:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A56F805B8A
	for <linux-cachefs@redhat.com>; Tue, 28 Apr 2020 19:25:14 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-41-ThLQc4BdN7WRbdJFGO6YzQ-1; Tue, 28 Apr 2020 15:25:11 -0400
X-MC-Unique: ThLQc4BdN7WRbdJFGO6YzQ-1
Received: by mail-qt1-f195.google.com with SMTP id w29so18320874qtv.3
	for <linux-cachefs@redhat.com>; Tue, 28 Apr 2020 12:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=vip41qUVMKBqTzEGULB2fq8TW2WA+09ehaEg4M6b7gA=;
	b=S6197mr5WrmdojEbxsHubSGiK7VAhz0XJPskJdxh4TWAdc1SP3PHCvEcYn7tHRHrSr
	945CpstVu8cl4zCgZnOwx8dWAsOW41C/PzZ/PejaefJ1b+PQYDQdsQb7gIqZTb2PE5ya
	LSkgAP3TUS0dYrJ0dHC8xsFz18B+KikX3wDPeA9BcSKQEd6U40aYwAaKWM/XIK7dg1k+
	SYsS+nmjJUtVLPlSHbLBx/ERmXgWUo4VrBOl8JvC6F5xl6OPgcx7nlZMZfAtGQVtpSAK
	R+sPsTPmpO2g3s78ixNBmtJ6sZVODUWCnEHfbafELNWLKiddqKiRiQAtXEvvhC9SKsZS
	L2rQ==
X-Gm-Message-State: AGi0Pub7Son5ArFVhN2wwxslJWijLjmW/8pT5Pe9jqaitWennIjzkt2j
	e3Y15mhgUrvM1KhhY0UJOp76Lg==
X-Google-Smtp-Source: APiQypIhJhTV5HGwJH/cgQxWAhYS/uXm9mZJikUijUM58zV+qHDsER/fp3y62V6/MA+IjGf4ymv/JQ==
X-Received: by 2002:ac8:1a2b:: with SMTP id v40mr30279995qtj.170.1588101910910;
	Tue, 28 Apr 2020 12:25:10 -0700 (PDT)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net.
	[2001:470:7:582::2]) by smtp.gmail.com with ESMTPSA id
	y9sm14261631qkb.41.2020.04.28.12.25.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Apr 2020 12:25:10 -0700 (PDT)
Date: Tue, 28 Apr 2020 15:25:07 -0400
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20200428192317.7h5d2wiqmy7y473r@cs.cmu.edu>
Mail-Followup-To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
	<20200428130128.22c4b973@lwn.net>
MIME-Version: 1.0
In-Reply-To: <20200428130128.22c4b973@lwn.net>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SJPH1M002453
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 04 May 2020 06:39:10 -0400
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-cachefs] [PATCH v3 00/29] Convert files to ReST - part 2
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Apr 28, 2020 at 03:09:51PM -0400, Jonathan Corbet wrote:
> So I'm happy to merge this set, but there is one thing that worries me a
> bit... 
> 
> >  fs/coda/Kconfig                               |    2 +-
> 
> I'd feel a bit better if I could get an ack or two from filesystem folks
> before I venture that far out of my own yard...what say you all?

I acked the Coda parts on the first iteration of this patch. I have no
problem with you merging them.

Jan


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

