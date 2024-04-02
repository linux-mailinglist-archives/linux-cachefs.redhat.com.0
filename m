Return-Path: <linux-cachefs+bncBDLIXLMFVAERBX4LV6YAMGQECRQCLMY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE9894DD6
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Apr 2024 10:46:24 +0200 (CEST)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-478473d78f3sf427415137.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Apr 2024 01:46:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712047583; cv=pass;
        d=google.com; s=arc-20160816;
        b=nW3QJBYZDgF1aGSf5jkSWGn7tJWrD85Am7l54FAaey5BZYN1hm4NYKpJarllisxoo3
         BPpg98wLFG1K5lCztK31MgbzXVeL+2rm3RaLDD1nLPqL2fI2ulx1GIMTavLIQUj32vkS
         k9EwCQP9E3I3ZepyoSkA7BbpRIj7kf+8goZmVlqfAfHjzJtIA2SMu+wEhgtoHYTf+rjw
         cUrLs+TsMJbXBBRHiRneh3Hzo2S0oFvmzML2r6xYObFRu8BXhqrgX+DNIyp7fIzZwPhr
         BhboMzEZyROw8X/p1L7g/Zqkfd1M012a5lWNzRNZjWZhbCIWhFW7m6e3eMp6sc7tOOAS
         u8SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=k4PwcGbFa5KZFntQUdoIHMtKYzLx1Y8qwf9b9kYPnEU=;
        fh=9liGA8DXsbzUA4F/Kss9SBuaW8cdaP7dQ+xwcvi3ZFI=;
        b=hfzKsNM41hQKs/KsLgvO9ZApRdxhRt7ypeJPDB/DlAC8XxScnVzpkZKsMnMhSVLyuU
         cygVppLbbve8sU70qcWZxEYTYbO3TGAk4u0SaZ696oaFntc0TcRamqndkrIzAIUG1xg+
         QWf52IQS+F10TLY7MnnJHNtDt6rQe0On3u7RPvlUGTGknvBJBca959M7woqc1Q6eqZ36
         N/ojnkchNc/SobiEq0Bk15ZPDDxFttRYw+iFz9ek65LXU1RoxlylNMyQQRfT7NbklHQ7
         qzTRQwvsXa+Apx3CKikZ82ox4YXvsb2f1FrOEGkfeIiXptQ2yl+HNZnaVzWtM9YB2lwN
         5LMQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047583; x=1712652383;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k4PwcGbFa5KZFntQUdoIHMtKYzLx1Y8qwf9b9kYPnEU=;
        b=CRs4sfwq+WNPsdxcJzEfLLfDYot7cn0MJwOEHTlkQf/Cx76iEEu3P+IFCGwpLw6cbp
         9UH6z/eNS4gaPvr39m1X7pamFqyV2rT+kv77iowVuUMzdGiOPDeWKPbxggDQOBMujNU8
         0rc8RQGtrWfgDzmAMPbYMLRI4oOswoCeqfHlEiewFnxwxxQl8P0ymlP4IyA0nje7ccud
         8zkva7CmyauHxUw2S8XwFwoWfr5shTg/642h18n2x5SWJ8HcKNthq7uDv/xTA5gSqt6U
         CaiKlNkOPfqKRJGmkRoxSvhVvHHDAy6cvJ8DOzrJzWS5Y8057a2aDNgkxzCDaLl7vSJ2
         d90A==
X-Forwarded-Encrypted: i=2; AJvYcCVG1Q2OZscU2nKhKTc/4B+S2bWVm2321OvAjdJm8NTb0Xu3qeQAVovjXH6gBOTM5feG5l8hskZbgfmo+7r+HbrIB+k3kjxKeOjQbhA=
X-Gm-Message-State: AOJu0YwPCWxAWvwMHQm2j0u+AcZJAda0ypf2XHZsoZl1xwmqlqiMjB92
	3qAHROc9pZr904O8P6rqzamBhYJoWeWnTTD/YATVC0xHM0ZHMU2GnPWNX7dTxr0=
X-Google-Smtp-Source: AGHT+IFUj7FeeilQXc3c4Zgn0BDAQQGrOCR20dOgXvMznArpuHhE+Ds990CjQ+l3v7K4yXVlXsxuTg==
X-Received: by 2002:a67:bc09:0:b0:476:f039:3ec5 with SMTP id t9-20020a67bc09000000b00476f0393ec5mr10167359vsn.16.1712047583201;
        Tue, 02 Apr 2024 01:46:23 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:f67:b0:690:bae8:6289 with SMTP id
 iy7-20020a0562140f6700b00690bae86289ls3302qvb.1.-pod-prod-09-us; Tue, 02 Apr
 2024 01:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTSSDiCRK4DFCWdv93dvWefF3hZOSX+TuGnzpIFV1+qpBASv8pyPCoiF9bur92v0cPzZFbORd00nwyZf/OFN2UiRsBrdip6srrfw+P3Ao=
X-Received: by 2002:a05:620a:3945:b0:78b:ceef:7c16 with SMTP id qs5-20020a05620a394500b0078bceef7c16mr14623920qkn.37.1712047582528;
        Tue, 02 Apr 2024 01:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712047582; cv=none;
        d=google.com; s=arc-20160816;
        b=bqMsjeC4f+R15BQBkWBoengMVqbntstaqRfJTj9B9kIg6d7bO/3o3xr1MkOGRcBr+K
         eGbuENpY+qDet4RhFcV0cFOl0++phy1TIINICrlfkLlUbQzWSi6bfCtMaB3dsLVu26E8
         Az6V9EgG6CxzDVZ9SkE8DJXyAM1rMqLE/EUzeWkT1B1Md0VtkOCe5MTX7CTQXUJcMLXN
         ipk39be8FKETREFQ7xP34FZ5RKHXutczU3w7GuEPsL7ZBghd8lWJeCQCPINpchl8qPZ7
         phcLEM/JrlwW2ah9xX5nMIy8mkBTE8rUlwq58z57V5h8pB5JdQR/CZuXJb/7cTaPSnxA
         HHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=Zy4kSHbLqEaFJ3o84Off1kglzZwacK56/Ku+3O7Z3z4=;
        fh=+KwpZj2h0X3q1kWpk0tqd4t4VhakhZMU5zA6H8yXCdY=;
        b=HSnWgCswLD6f84SgvNjF4+Qwj8HR2wVpNRWYh8JTgEX/NiSjD9SugjmJvOkeu7dsGT
         qppGxAMjhStApOh26ZlAMyIGYKsWzH68k7Pv9SVVEpb63bWCzetVOlQFjgxoxtCjegTl
         6IGPliZURrN6y4lWNJNWGt44TGJ3FSZHCKCehDElYlBoOvFpaZx5R8skgZprzYmTpOVw
         3snr1iQgLqH95/WgcsqVbAyxZLM+dYzF4di91g4GqS7TJfdosgQ61lr2e8yMie14R8CW
         og4typJ+W7v+9XfxEMcLRhPPKKQmYwMmXGrrwo/V/aOdwhcR7IS9/jkekv7VgNCBS4BN
         mGcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id k4-20020a05620a0b8400b00789eb507830si10800554qkh.550.2024.04.02.01.46.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 01:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-VO2AoNPuPUWUyzq6MW6mZw-1; Tue,
 02 Apr 2024 04:46:20 -0400
X-MC-Unique: VO2AoNPuPUWUyzq6MW6mZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B02921C0514E
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Apr 2024 08:46:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id AD7201C060D1; Tue,  2 Apr 2024 08:46:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5BC1C060A4;
	Tue,  2 Apr 2024 08:46:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-20-dhowells@redhat.com>
References: <20240328163424.2781320-20-dhowells@redhat.com> <20240328163424.2781320-1-dhowells@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
    Naveen Mamindlapalli <naveenm@marvell.com>,
    Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH 19/26] netfs: New writeback implementation
MIME-Version: 1.0
Date: Tue, 02 Apr 2024 09:46:11 +0100
Message-ID: <3047564.1712047571@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3047563.1712047571.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> +struct netfs_io_request *new_netfs_begin_writethrough(struct kiocb *iocb, size_t len)
> +{
> +	struct netfs_io_request *wreq = NULL;
> +	struct netfs_inode *ictx = netfs_inode(file_inode(iocb->ki_filp));
> +
> +	mutex_lock(&ictx->wb_lock);
> +
> +	wreq = netfs_create_write_req(iocb->ki_filp->f_mapping, iocb->ki_filp,
> +				      iocb->ki_pos, NETFS_WRITETHROUGH);
> +	if (IS_ERR(wreq))
> +		mutex_unlock(&ictx->wb_lock);

This needs a "return wreq;" adding and appropriate braces.  Thanks to those
who pointed it out.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

