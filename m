Return-Path: <linux-cachefs+bncBDLIXLMFVAERBZ77ZCVQMGQEH7GUG6I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF0E8094F8
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:58:00 +0100 (CET)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5d340a9cf07sf16686057b3.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:58:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701986280; cv=pass;
        d=google.com; s=arc-20160816;
        b=RMHAmTSELw9eJFz1Zbpdz1CeftjfxLPFhKh7Napt74yrIJcPLwHnTi2IXhxONgk+ow
         vBj/0Zlov2ovYA3CdMXnB3KgOwX11tNmXZrD2c8NjiL9M8l/TPWAlYu+p/UL0f6TgQW9
         K9VsmQCEqyT1QKJ4gusatbAkUaKY8GObgf657Va8w/xF0/3DGeGUWYrqr2do4+CbJJN0
         KBynxzcypcELoYH1ortJpr+jOmoymhfGNnOQtuxhwU+Fl437KDu6u5vEkYyE8FKWVLW9
         k/KNe8V4fszn0vMer06PMR+MoSsTa2Hw8KqxPQAvAFK2VUU8edKcxN0lBmRAgsL7TiBz
         6JnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=pvGCPu1HsuvmLRAGG43e+RsGZp2CbPnwqPJXEwNIRvI=;
        fh=yIDznifpxrrvsjZy3g+jijG4g7ja0E5j5HJqf3Ctp6k=;
        b=uz3UsxkMoh2OEDYKo/L0K72UbpufeH/wJduEEjHTOxMYWHjiKmtrjy3c5E/SWEu/+m
         YfnCg9PXTTpq3kvRqDVx8mEX943sVsBxVuwdE7pRf6ZBjiWuP4fQSPAbJt++To50Y36n
         AAAQFYsCHtFhmqz3Rd4cxi5M3H9YMP5lWcQznLKIns7fQlmB1x2LPncPPlgY+QfwB7h5
         8XRYBxKOW9vEk4CClHoaLH85VJr0oqWYlw+Mel9/ASedwwuNglxwlqMerF89RCOn187w
         aXD/6udtlwcr8cPVA5urm4xzxIvZcoqYR6uewXK4mcchP6C9Pv49/QYEkNQ6d93DJaAO
         p0Rw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701986280; x=1702591080;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvGCPu1HsuvmLRAGG43e+RsGZp2CbPnwqPJXEwNIRvI=;
        b=MsJJ+agDZoP/wyPqiHXJ6NGw+2JZzHV2+C8jIS6Zil2vZcU5g59vh8N7PiGY9wc69u
         +pQDL5meROVfUWwOZXW6ppdAKAwTP6x6xZLh/hGgUNcAgvhmN8gpNjwc50Qy+y8YR7KK
         4k8zvUiEL9NSXZk2k1b6vZPD0AUXI/nnRC94J8AA5o5p5CoYmu/M0SrJLDqVQVqAL+ft
         06O0IIC9MXwYTCW772BSwFl3uD3vjoXzxBv//BP5rYJ8G8nKu5xCykZ4myKdsJVhRkdE
         BlZ8OywkwlK5wANskaKNvZ7A2dCGkZM0SySY9qBgI1u5eyvAl56DPlqJ8PJ/JkMIFfKp
         4JcQ==
X-Gm-Message-State: AOJu0Yx5JuPCyUssvN3CtZ4uf8o7jeuMSYx/UlqsuueXptarHgy6mRfb
	E2V/aH1r6zlgxd3FVAOSv2D5iQ==
X-Google-Smtp-Source: AGHT+IESJYKupiYHFMUDcbAHFrki5NkppzbaeEMgigr9ESBqyeKZKiCOoxqfK8aS+r58K1k7qAL/SA==
X-Received: by 2002:a81:6dd7:0:b0:5d4:195e:31db with SMTP id i206-20020a816dd7000000b005d4195e31dbmr3276918ywc.2.1701986279744;
        Thu, 07 Dec 2023 13:57:59 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:bec6:0:b0:67a:a15d:e966 with SMTP id f6-20020a0cbec6000000b0067aa15de966ls1204723qvj.1.-pod-prod-05-us;
 Thu, 07 Dec 2023 13:57:59 -0800 (PST)
X-Received: by 2002:ad4:5047:0:b0:67a:a721:cb02 with SMTP id m7-20020ad45047000000b0067aa721cb02mr3312128qvq.99.1701986279233;
        Thu, 07 Dec 2023 13:57:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701986279; cv=none;
        d=google.com; s=arc-20160816;
        b=aIa0Sv1FcL/qVfxPn0ocvN2X9wlMWWxCLLmvBYFdHixyIq431cDBIvE3QlHvBFIHla
         6YRqL1i4teH4EJsajumugvUU6w30KFw0zhBLrXTD8HKJMOLFKsFOkqR7jE9Cbh3jsNXj
         320UUQA9uypel6lZBa4PxwnHYP1Xs/IU0+bsuMIrSHncB+ir3KLs2v4DFfdevANMhSjP
         a2s9DHUYgZ0mrXFXeE4KZN911ll6cKvs9a2cyGOZlPElDtCp386y9ZquUqAgzr2u/IUb
         2qr+BoqD9nOsPNg3J0K+zQPEiAP/JbcFL6+6PTVZe9gS97ZonOymQzwc6EshHJzEDM6V
         430A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=2gpuqenBf/seLQmhrTte/4HdPOyV33jxxLbSCYkPyeM=;
        fh=yIDznifpxrrvsjZy3g+jijG4g7ja0E5j5HJqf3Ctp6k=;
        b=vID8Q4uCT2rtT0eBcFdt0Sxl3ohGH7zN0AsiDhkadj5s1V+DfYSeN3IpwNBtzgSC6u
         pYgp5kGq/ynIzFoD3wPfYsoPi/vDgxV9JjP5C2oH0eifFD3q0C05yJm5WtgZRGI0tqt3
         Lk3HbtM0WPf2eMP8jTHijSXn1isB+UC/6766RywMBNyc2nxmgWmBW7cFQgRfbLz0SpJr
         lf9+X014XCH2aEJg5ZPHPH22cRusGEKnudMmfwhOdZG8RBN2dNU3BdXkYgpzQNpDxFJ9
         RrPG5TSfWfX9VGYUgq7Iikvhk8B8iQ2ZKtq5sAtALSJOmyB85FqxeyKYmc4mExfGMKof
         73cw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id dp3-20020a05621409c300b0067ab8280dc4si654566qvb.492.2023.12.07.13.57.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:57:59 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-YYdKAUyYNc2lsEpDhedQAA-1; Thu,
 07 Dec 2023 16:57:56 -0500
X-MC-Unique: YYdKAUyYNc2lsEpDhedQAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 816B629AC008
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:57:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7E0F21C0652C; Thu,  7 Dec 2023 21:57:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E59971C060AF;
	Thu,  7 Dec 2023 21:57:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZXI7aGHkxZyiytXg@casper.infradead.org>
References: <ZXI7aGHkxZyiytXg@casper.infradead.org> <20231207212206.1379128-1-dhowells@redhat.com> <20231207212206.1379128-60-dhowells@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
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
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 59/59] netfs: Eliminate PG_fscache by setting folio->private and marking dirty
MIME-Version: 1.0
Date: Thu, 07 Dec 2023 21:57:53 +0000
Message-ID: <1451127.1701986273@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1451125.1701986273.1@warthog.procyon.org.uk>
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

Matthew Wilcox <willy@infradead.org> wrote:

> On Thu, Dec 07, 2023 at 09:22:06PM +0000, David Howells wrote:
> > With this, PG_fscache is no longer required.
> 
> ... for filesystems that use netfslib, right?  ie we can't delete
> folio_wait_private_2_killable() and friends because nfs still uses it?

Yeah.  Though I have my eye on NFS too ;-)

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

