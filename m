Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD5C354E4F
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 10:09:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-CDYjvplUPPOJyMMkXUVWZg-1; Tue, 06 Apr 2021 04:09:26 -0400
X-MC-Unique: CDYjvplUPPOJyMMkXUVWZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24FCCE49E0;
	Tue,  6 Apr 2021 08:09:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A621A50F89;
	Tue,  6 Apr 2021 08:09:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 848254BB7C;
	Tue,  6 Apr 2021 08:09:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1330W2Wk025609 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 2 Apr 2021 20:32:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5C34105459F; Sat,  3 Apr 2021 00:32:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E18F6105459A
	for <linux-cachefs@redhat.com>; Sat,  3 Apr 2021 00:31:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B2A585A5A8
	for <linux-cachefs@redhat.com>; Sat,  3 Apr 2021 00:31:59 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-537-OHU900DPNPiWHfgNl-pZEQ-1; Fri, 02 Apr 2021 20:31:57 -0400
X-MC-Unique: OHU900DPNPiWHfgNl-pZEQ-1
Received: by mail-qk1-f181.google.com with SMTP id 7so6619221qka.7
	for <linux-cachefs@redhat.com>; Fri, 02 Apr 2021 17:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=CvEaf7XI2+OL6Uz4F6ps4uPZx9GzX6Ggnfr2XHs6ui0=;
	b=ZAcvd13mDTbG4dlw/GjOylxs3L3IZZ3WBRXJxVWiLRqfMJSEvQLRwLen4xpdbq3mVp
	jMvKVXg8V13l12qzkuSuKFZx0mmyEWi6MS+8WxBo41ugPJR4UiN9LpDVkEQe+7RcSoLg
	o2zCoBeq4cp6cg2QF3k2qPqWOB6VhGEUwIs1KNA2jfdwy7DQFCsxfQ8y0RoWpMJof+za
	Ts13uqfaMBgJ03XpspQW2fcN18plzXLUcBU6KI85zNlOn3iEjOgbLl3aCmTWpgawF0WG
	j+ep8c8p+kXFV+ow8rVH+psSZTramA/MYpVoLHjRbDNkZn1a7L4Rj4wbvcVSfsyzVHKF
	ae6A==
X-Gm-Message-State: AOAM532khwA9p6ytsMKKbxFi1aD++ROQBPDrxk9/QHSKEGwF3W6uBzRu
	fiK6FtNSOcBVzq2Rh/odgw==
X-Google-Smtp-Source: ABdhPJwHpcNhSbKtS1P/Tix+YFdtCPahhDLMiuyLXSp2OhNYqLKX4Kws1fIiT8qFDJe8lAAe2iLnww==
X-Received: by 2002:a05:620a:134a:: with SMTP id
	c10mr15166572qkl.481.1617409916852; 
	Fri, 02 Apr 2021 17:31:56 -0700 (PDT)
Received: from moria.home.lan (c-73-219-103-14.hsd1.vt.comcast.net.
	[73.219.103.14]) by smtp.gmail.com with ESMTPSA id
	i25sm8253285qka.38.2021.04.02.17.31.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 02 Apr 2021 17:31:56 -0700 (PDT)
Date: Fri, 2 Apr 2021 20:31:51 -0400
From: Kent Overstreet <kent.overstreet@gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YGe3dy5OmT12NVYK@moria.home.lan>
References: <20210331184728.1188084-1-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210331184728.1188084-1-willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 06 Apr 2021 04:09:17 -0400
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 00/27] Memory Folios
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 31, 2021 at 07:47:01PM +0100, Matthew Wilcox (Oracle) wrote:
> The medium-term goal is to convert all filesystems and some device
> drivers to work in terms of folios.  This series contains a lot of
> explicit conversions, but it's important to realise it's removing a lot
> of implicit conversions in some relatively hot paths.  There will be very
> few conversions from folios when this work is completed; filesystems,
> the page cache, the LRU and so on will generally only deal with folios.

I'm pretty excited for this to land - 4k page overhead has been a pain point for
me for quite some time. I know this is going to be a lot of churn but I think
leveraging the type system is exactly the right way to go about this, and I
can't wait to start converting bcachefs.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

