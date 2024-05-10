Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3NG66YQMGQESKLDURQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E52C8C1F58
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 May 2024 09:57:35 +0200 (CEST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43dfc9d15c1sf9874671cf.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 10 May 2024 00:57:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715327854; cv=pass;
        d=google.com; s=arc-20160816;
        b=xWlzcl4NBpUUNOVcIUEfM6BWuwJrvPuHfymmgx7UyaqGU/REAS+CkTwdcZasWSO00/
         FHewNub+zRGZl8FhSapQDzE/r8QuoopkMjs/ahfITmyAA2bJ44mzbLMbYJJMpazcV9QX
         LS+xnMMML0vpuSsOEaq3bIkbvIKp3YQTn0mz2vm7gUICL72/TOblkZJGSNU/bDY4Yfun
         ZZeDXNoebGWjUl4q53WNCfeyIJS9ipisroLCZmJ6oYLfW5beJem7GY7Xf4w6Ck/E/deo
         G8R46G/OnJQqQqVozHddrAR3J6R/T+pLiy9Nr2RR8h95qxbr+6jfSt6fPDXLhyQkHy0N
         xzFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=mH4ShfusolGDIlDNsJjdtO6VWJOnfUC1KHa80D1HHew=;
        fh=/BOPcB2Nv6+V+k6ONgVeEzRc67IN4HAZManuhXcRdH0=;
        b=IPR5djPpUO1a3Wwv63ZNOtUZBDNq5kJRQtN5W5U+lc+tVFkTe3RoGriaEnpP+vj6h2
         b6Rm+sHtKDy6ARkBvnNbOLzA7eGNh/udUuktgAgkgd1hfSXM+LUJSgl3oyVnsiu2/oBs
         HzFDNB+OsTQSlWkWuiuLox73tTxYnYP9e5otI4Ban4QoijvZ1S1yXB7sSD8QsIXFkCYX
         ozhUnkgI/j+e/8JER5ec1QIG70XBK11WEhM7C08BjBYPpatBhruxzBVzlWwu6WtRWraV
         0de4b/UVUjRnY7pJc0CblKLOaHb3aF8lvKUQ/RZ44sOm4C4hEZeyHROqAsICOgeiyZE7
         OFSA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715327854; x=1715932654;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mH4ShfusolGDIlDNsJjdtO6VWJOnfUC1KHa80D1HHew=;
        b=jZ4EivOPF02VzP9XIoCP4ajMqDye2FIGmOq0VSYy20v9/dZ/YD4AfVWsD4cHwKWFKf
         XaJQ71t54MafQvneUK5b32Ix4KedXtUTnZBYgQL7mzgg2gMyU/WqhR9tYoYDNSnWj0Wv
         gX4AgRttyHEJqehf34G3xuTheVV8gz/6Y/V6BxcMFK8RVI4njmq4XfItYmJ+gs5Lz6U+
         11HFhDtBeocTsGh6Hg/8K6A9I3K3opcfEGdHKMX3+Oe+bBxqm9/HFCc8MkCupnGiycI2
         5Fn5Tmq8jivDx1hUUP+/M2fg6BhNEmenvtcfgatpbnVp+5CQ0b6sZB8KLucQLZMaI3ts
         etfw==
X-Forwarded-Encrypted: i=2; AJvYcCXmn+lADp617J3Rqht5/mpEhM1v1pOgwmvVyemnDXnYK1iLdvXrKjvxUaSWS/Xfjg+HeLVBdp+g6cx/S6OSutivXLaa5cncnGISHSQ=
X-Gm-Message-State: AOJu0Yy92eXXfd9E6ggSTJY+1XwKEUpiFE8dAneDFaxe1bK9cXrrWPBd
	30O8uhJIr8qjvsawl+lf4uIjokKxEGTGhcrWAEriTr1bJFnw87DXOo1ixj2FGR8=
X-Google-Smtp-Source: AGHT+IFLoHoZFEvgzTrPDZ9zK0SZmtwdczSxObglo/oBOxtpC7hAsZFhN/5LIwD5Rv6bg6ie3Hj/HQ==
X-Received: by 2002:ac8:7d15:0:b0:43a:d899:79a6 with SMTP id d75a77b69052e-43dfda8ce04mr21262151cf.7.1715327854113;
        Fri, 10 May 2024 00:57:34 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:4a:b0:43a:dc52:cd68 with SMTP id
 d75a77b69052e-43ded02334als24824501cf.0.-pod-prod-06-us; Fri, 10 May 2024
 00:57:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvni7ug5kmIEV8czfGbQQ+Qe5mzkdrDycdtby37F6F7uflnuFedJNV040q99G8Vf+8VPDAi9WCnKVg22dEeX2SM3r4Ajn5bDVgkXM6PS0=
X-Received: by 2002:a05:622a:14:b0:43a:d4e1:1dcb with SMTP id d75a77b69052e-43dfda8e62cmr18934991cf.13.1715327851998;
        Fri, 10 May 2024 00:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715327851; cv=none;
        d=google.com; s=arc-20160816;
        b=G1kCzVw5mZdSDCQ8KrBDWVolFE/qloTwXkJNdi4xorgnYo39sbR6oFIZKmNp6hV3kl
         UpMdqRoRd0LsyoDgGsi375azVTZwQ1k4t1gAqAaj4b9GnVCWomra9LEQ/JoJC5Fm+Dlg
         guf/233ezqbrOkIfklWYjYLP9X5oqgKnf4j5jUtibupo2cVxUgD4Z/wCv95I5MhV/BvP
         souVyl+U/dhcXxNtmvb0lwp+TtLN5sKU0W/t3wOsUo+SYHcOaeh5aF/1xmd2lJWyfDBJ
         RpOd6gK+22YwNpEzuIICAyS713X2pEPPkcEtG2jJ/Jm6+dms81Mat8t9MWNu84Q/d1dD
         NpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=0ZBc+Q6dI2nvBKuIrhZxI1E2dONPs+Fjuws1+0I2wc0=;
        fh=Ndl4y6TQgpJMhZetPQknYnZfU2jhAQpMn6ov6D6ReDI=;
        b=o77w+xvia4rZqXSOq+hk3ALsfvBvRO4K2zTysQv7VE6hgTr68pE/XOT82nxzfuxV8o
         T7lcSwqzHY5GmKSCcKShCWHAvAGBhIWG1gXUNj/z64KB428m7i/8l0z99lWZZF0v13wD
         rwiFAidQwLPigjFhbYDJRnEf0ThOukKfbvGqs/4IHmSXnD7xh2Tf9IkPs8gX8W2sNJBr
         0Ze9wj6gRCw8x9LUFwR+NzO4aODuzcs5cTxEi7s2tojFEflnvvgjMhrl3xtobXaU/BpD
         e0opwFeKhZvu6QjlG6mIwMoIUALL1l6McV37RQIoSCwuad9P8KWL43UyLSIVOF/ceoS9
         v+Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id d75a77b69052e-43df566f7cbsi31830771cf.232.2024.05.10.00.57.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 00:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-9eYCYRyKMmi5qnturttW6A-1; Fri, 10 May 2024 03:57:28 -0400
X-MC-Unique: 9eYCYRyKMmi5qnturttW6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFEEE800656
	for <linux-cachefs@gapps.redhat.com>; Fri, 10 May 2024 07:57:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A8BC011847E6; Fri, 10 May 2024 07:57:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A1BA11847D6;
	Fri, 10 May 2024 07:57:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Zj22cFnMynv_EF8x@gpd>
References: <Zj22cFnMynv_EF8x@gpd> <Zj0ErxVBE3DYT2Ea@gpd> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-41-dhowells@redhat.com> <1567252.1715290417@warthog.procyon.org.uk>
To: Andrea Righi <andrea.righi@canonical.com>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH v5 40/40] 9p: Use netfslib read/write_iter
MIME-Version: 1.0
Date: Fri, 10 May 2024 08:57:22 +0100
Message-ID: <1578871.1715327842@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1578870.1715327842.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Andrea Righi <andrea.righi@canonical.com> wrote:

> The only reproducer that I have at the moment is the autopkgtest command
> mentioned in the bug, that is a bit convoluted, I'll try to see if I can
> better isolate the problem and find a simpler reproducer, but I'll also
> be travelling next week to a Canonical event.

Note that the netfslib has some tracepoints that might help debug it.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

